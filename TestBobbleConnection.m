%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tests that Matlab can talk to Bobble-Bot
%% More information here: https://github.com/super-owesome/bobble_matlab
%% Author : Mike Moore (June 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LoadBobbleMessages();
handles = InitBobbleSimConnection()
pause(0.25);
ActivateBobbleBot(handles.cmdBbPub);
pause(0.25);
velMsg.Linear.X = 0.25; send(handles.velPub, velMsg);
pause(1.5);
velMsg.Linear.X = -0.25; send(handles.velPub, velMsg);
pause(1.5);
velMsg.Linear.X = 0.0; send(handles.velPub, velMsg);
pause(1.5);
ResetBobbleBot(handles.cmdBbPub);
pause(0.25);
ActivateBobbleBot(handles.cmdBbPub);
pause(0.25);
velMsg.Angular.Z = 0.1; send(handles.velPub, velMsg);
pause(1.5);
velMsg.Angular.Z = -0.1; send(handles.velPub, velMsg);
pause(1.5);
velMsg.Angular.Z = 0.0; send(handles.velPub, velMsg);
pause(0.25);
ResetBobbleBot(handles.cmdBbPub);
rosshutdown()