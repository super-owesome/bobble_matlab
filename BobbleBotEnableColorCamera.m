function colorImgSub = BobbleBotEnableColorCamera
    %BobbleBotEnableColorCamera Subscribes to the appropriate color camera topic for Bobble-Bot
    colorImgSub = rossubscriber('/bobble_bot/camera/image_raw', 'BufferSize', 5);
    receive(colorImgSub,3);
    disp('Successfully Enabled Camera (raw image)');

end

