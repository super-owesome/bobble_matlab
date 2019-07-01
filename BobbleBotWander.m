function [vel, omega] = BobbleBotWander()
    %BobbleBotWander - Make BobbleBot wander around. Used during seek mode.
    maxTranslationalVel = 0.1;
    maxAngularVel = 0.15;
    persistent translational_vel;
    persistent angular_vel;
    if isempty(translational_vel)
        translational_vel = 0.05;
        angular_vel = 0.05;
    end
    % Apply randomness
    perturb_trans = (randperm(3)-2)*0.02;
    translational_vel = translational_vel +  perturb_trans(1);
    perturn_ang = (randperm(3)-2)*0.1;
    angular_vel = angular_vel + perturn_ang(1);
    % Apply limits
    if abs(translational_vel) > maxTranslationalVel
        translational_vel = maxTranslationalVel*sign(translational_vel);
    end
    if abs(angular_vel) > maxAngularVel
        angular_vel = maxAngularVel*sign(angular_vel);
    end
    vel = translational_vel;
    omega = angular_vel;
end