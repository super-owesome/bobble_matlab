function PlotBlueBallLocation(img, binImg, c)
    figure('Name','Image Calibration','Position',[100,100,400,600]);
    subplot(2,1,1)
    hold on
    imshow(img);
    if ~isempty(c)
        plot(c(1),c(2),'+','Color','r','MarkerSize',20);
    end
    hold off
    subplot(2,1,2)
    hold on
    imshow(binImg);
    if ~isempty(c)
        plot(c(1),c(2),'+','Color','r','MarkerSize',20);
    end
    hold off
end

