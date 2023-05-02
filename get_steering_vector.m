function [a_passive_theta] = get_steering_vector(Np,theta,delta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = 0:1:Np-1;
    theta_rad = deg2rad(theta);
    a_passive_theta = exp(j*2*pi*delta*sin(theta_rad)*n)';
end

