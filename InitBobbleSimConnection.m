function [handles] = InitBobbleSimConnection()
    ipaddr = 'http://localhost:11311'
    rosinit(ipaddr)
    handles.colorImgSub = BobbleBotEnableColorCamera;
    handles.velPub = rospublisher('/bobble/bobble_balance_controller/cmd_vel');
    handles.cmdBbPub = rospublisher('/bobble/bobble_balance_controller/bb_cmd');
end

