function BobbleBotSetVelocity(velPub, vLin, vAng)
    %BobbleBotSetVelocity Sets linear and angular velocity of Bobble-Bot
    persistent velMsg
    if isempty(velMsg)
        velMsg = rosmessage(velPub);
    end
    velMsg.Linear.X = vLin;
    velMsg.Angular.Z = vAng;
    send(velPub,velMsg);
end
