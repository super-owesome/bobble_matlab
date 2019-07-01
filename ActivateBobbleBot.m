function ActivateBobbleBot(bbCmdPub)
    %ActivateBobbleBot Activates the Bobble-Bot
    persistent bbCmdMsg
    if isempty(bbCmdMsg)
        bbCmdMsg = rosmessage(bbCmdPub);
    end
    bbCmdMsg.StartupCmd = 1;
    send(bbCmdPub,bbCmdMsg);
end