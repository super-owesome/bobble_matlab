function BobbleBotTrackingTimer(~, event, handles)
    %BobbleBotTrackingTimer - Primary update loop for track and follow control.
    %   BobbleBotTrackingTimer(~, event, handles) updates the state of
    %   Bobble-Bot using the pub/sub ROS messages passed into this
    %   function through the handles struct. This controller loop defines
    %   object tracking behavior by using the camera image messages.
    %   The first argument is the timer object.
    persistent bobble_state
    persistent ang_vel_filt
    persistent lin_vel_filt
    persistent initialTime;
    maxSpinTime = 0.5;
    lin_vel_filt_gain = 0.7;
    ang_vel_filt_gain = 0.7;
    [object_finder, image_controller] = initControl();
    currentTime = datetime(event.Data.time);
    % Initialize state and persistent variables
    if isempty(bobble_state)
        bobble_state = BobbleBotStates.Seek;
        ang_vel_filt = 0;
        lin_vel_filt = 0;
        initialTime = currentTime;
    end
    % Update state machine
    switch bobble_state
        case BobbleBotStates.Seek
            latestImg = readImage(handles.colorImgSub.LatestMessage);
            [center, scale] = object_finder(latestImg,handles.params);
            if isempty(center)
                [translational_vel, angular_vel] = BobbleBotWander();
            else
                [translational_vel, angular_vel] = image_controller(center, scale, size(latestImg),handles.gains);
            end
            bobble_state = BobbleBotStates.Seek;
        case BobbleBotStates.Spin
            translational_vel = 0;
            angular_vel = -0.25;
            if seconds(currentTime - initialTime) > maxSpinTime
                bobble_state = BobbleBotStates.Seek;
            end
    end
    % Filter velocities
    lin_vel_filt = lin_vel_filt_gain*translational_vel + (1-lin_vel_filt_gain)*lin_vel_filt;
    ang_vel_filt = ang_vel_filt_gain*angular_vel + (1-ang_vel_filt_gain)*ang_vel_filt;
    % Publish velocities to Bobble-Bot
    BobbleBotSetVelocity(handles.velPub, lin_vel_filt, ang_vel_filt);
    % Sets which control and object detection algorithms to use
    function [objectTrack, imgControl] = initControl()
        objectTrack = @FindBlueBall;
        imgControl = @BobbleBotPointController;
    end
end
