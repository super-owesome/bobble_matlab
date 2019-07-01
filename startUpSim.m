%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bobble-Bot Matlab demonstration. Launches control loop
%% for following a blue ball in the Bobble-Bot Gazebo simulation.
%% More information here: https://github.com/super-owesome/bobble_matlab
%% Author : Mike Moore (June 2019)
%% Adapted from TurtleBotObjectTrackingExample (Copyright MathWorks, Inc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
javaaddpath('./jar/bobble_controllers-1.0.0.jar')
addpath('./msggen')
savepath
ipaddr = 'http://localhost:11311'
rosinit(ipaddr)
handles.colorImgSub = BobbleBotEnableColorCamera;
handles.velPub = rospublisher('/bobble/bobble_balance_controller/cmd_vel');
blueBallParams.blueMax = 30; % Maximum permissible deviation from pure blue
blueBallParams.darkMin = 90; % Minimum acceptable darkness value
handles.params = blueBallParams;
% Sets PID gains for tracking controller
gains.lin = struct('pgain',1/10,'dgain',1/100,'igain',0,'maxwindup',0','setpoint',0.75);
gains.ang = struct('pgain',1/1000,'dgain',1/3000,'igain',0,'maxwindup',0','setpoint',0.5);
handles.gains = gains;
timer2 = timer('TimerFcn',{@BobbleBotTrackingTimer,handles},'Period',0.1,'ExecutionMode','fixedSpacing');
timer2.StopFcn = {@BobbleBotStopCallback};
start(timer2);