function BobbleBotStopCallback( ~, ~, ~ )
    %BobbleBotStopCallback - Callback function called when timer is halted
    disp('Shutting down the Bobble-Bot ROS node')
    rosshutdown
end

