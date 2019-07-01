function [center, radius, ball] = FindBlueBall(image, params)
    %FindBlueBall - Searches an image for a blue ball and returns its
    %   center and radius
    %   [C,M,BALL] = FindBlueBall(IMG,PARAMS) searches a color image (IMG) to
    %   find a blue ball. Threshold parameters are part of the PARAMS struct
    %   input argument and require properties of blue_threshold and dark_threshold. The
    %   return arguments are the center of the ball (C), the radius of the ball
    %   (M), and the binary image of the ball after thresholding (BALL).
    % Derived from exampleHelperTurtleBotFindBlueBall.m (Copyright MathWorks, Inc)
    if isempty(image)
        center = [];
        radius = [];
        return
    end
    image_size = size(image);
    height_threshold = image_size(1)*0.25;
    blue_image = image(:,:,1)/2 + image(:,:,2)/2 - image(:,:,3)/2;
    blue_threshold = blue_image < params.blueMax;
    dark_iso = -image(:,:,1)/2 - image(:,:,2)/2 + 3*image(:,:,3) - 2*rgb2gray(image);
    dark_threshold = dark_iso > params.darkMin;
    ball = blue_threshold & dark_threshold;
    % Uses Image Toolbox
    surf = regionprops(ball, {'Centroid','Area','EquivDiameter'});
    if isempty(surf)
        center = [];
        radius = [];
    else
        [~, grt] = max([surf.Area]);
        center = surf(grt).Centroid;
        radius = surf(grt).EquivDiameter/2;
        if (center(2) < height_threshold) || (radius < image_size(1)/24)
            center = [];
            radius = [];
        end
    end
end