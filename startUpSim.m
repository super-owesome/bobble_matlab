ipaddr = 'http://localhost:11311'
rosinit(ipaddr)
handles.colorImgSub = exampleHelperTurtleBotEnableColorCamera;
handles.velPub = rospublisher('/bobble/bobble_balance_controller/cmd_vel');
blueBallParams.blueMax = 30; % Maximum permissible deviation from pure blue
blueBallParams.darkMin = 90; % Minimum acceptable darkness value
handles.params = blueBallParams;
gains.lin = struct('pgain',1/10,'dgain',1/100,'igain',0,'maxwindup',0','setpoint',0.75);
gains.ang = struct('pgain',1/1000,'dgain',1/3000,'igain',0,'maxwindup',0','setpoint',0.5);
handles.gains = gains;
timer2 = timer('TimerFcn',{@exampleHelperTurtleBotTrackingTimer,handles},'Period',0.1,'ExecutionMode','fixedSpacing');
timer2.StopFcn = {@exampleHelperTurtleBotStopCallback};
start(timer2);