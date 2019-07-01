function ResetBobbleBot(bbCmdPub)
    %ResetBobbleBot Resets the Bobble-Bot
    persistent bbCmdMsg
    if isempty(bbCmdMsg)
        bbCmdMsg = rosmessage(bbCmdPub);
    end
    bbCmdMsg.IdleCmd = 1;
    send(bbCmdPub,bbCmdMsg);
end