function [linear_vel, angular_vel] = BobbleBotDriveController(center, ~, imSize, gains)
    %BobbleBotDriveController - Drive Bobble-Bot and keep a specified point
    %   in the center of view.
    % Derived from exampleHelperTurtleBotPointController.m (Copyright MathWorks, Inc)
    maxLinearVel = 0.25;
    maxAngularVel = 0.25;
    filter_gain = 0.5;
    persistent linearVelPID;
    persistent angularVelPID;
    persistent linGains;
    persistent angGains;
    persistent filtered_center;
    if isempty(linearVelPID)
        if isempty(gains)
            targetPositions = [0.45, 0.55];  % Percent distance from top and left of image
            linGains = struct('pgain',1/1000,'dgain',1/5000,'igain',0,'maxwindup',0','setpoint',targetPositions(1));
            angGains = struct('pgain',1/4000,'dgain',1/8000,'igain',0,'maxwindup',0','setpoint',targetPositions(2));
        else
            linGains = gains.lin;
            angGains = gains.ang;
        end
        linGains.setpoint = linGains.setpoint*imSize(1);
        angGains.setpoint = angGains.setpoint*imSize(2);
        linearVelPID = ExampleHelperPIDControl(linGains);
        angularVelPID = ExampleHelperPIDControl(angGains);
        filtered_center = center;
    end
    % Filtering Equation
    filtered_center = filter_gain*center + (1-filter_gain)*filtered_center;
    % Update PID control
    angular_vel = update(angularVelPID,filtered_center(1));
    linear_vel = update(linearVelPID,filtered_center(2));
    % Threshold the output velocities
    if abs(linear_vel) > maxLinearVel
        linear_vel = maxLinearVel*sign(linear_vel);
    end
    if abs(angular_vel) > maxAngularVel
        angular_vel = maxAngularVel*sign(angular_vel);
    end
end