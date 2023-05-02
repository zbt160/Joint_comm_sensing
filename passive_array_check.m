clear all; close all;
clc;

% steering vectos
Np=10;
delta = 0.5;
passive_Theta_values = [0 -30];
SNR_p= 10;
INR_p = (10^0.3);
ap_theta = get_steering_vector(Np,passive_Theta_values(1),delta);

% Dp 
D_p = SNR_p*ap_theta*ap_theta';

% Rp
ap_theta = get_steering_vector(Np,passive_Theta_values(2),delta);
Rp = INR_p*ap_theta*ap_theta';

% wa
Matrix = inv(Rp+eye(Np))*D_p;
[U,D] = eig(Matrix);
wp = U(:,2);
% [D, ind] = sort(D);
% U = U(:, ind);

R_passive_signal = Rp+D_p+eye(Np);

SINRp = (wp'*D_p*wp)/(wp'*Rp*wp);

% 
% % beamforming
% theta_range = -90:90;
% count = 1;
% mag = zeros(length(theta_range));
% for i=-90:90
%    a= get_steering_vector(Np,i,delta);
%    mag(count) =  a'*R_passive_signal*a;
%    count=count+1;
%     
% end




