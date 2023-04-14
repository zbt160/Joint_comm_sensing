function [A] = get_A(K,theta,delta,Na)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = 0:1:Na-1;
theta_rad = deg2rad(theta);
a_active_theta = exp(j*2*pi*delta*sin(theta_rad)*n)';
% A = a_active_theta*a_active_theta';
A = kron(eye(K),a_active_theta*a_active_theta.');
end
