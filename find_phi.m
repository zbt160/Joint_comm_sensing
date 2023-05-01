


function [phi] = find_phi(All_A,t,SNR_ratio,Na,K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    R_t_over_sigma_square = get_Rt_over_sigma(All_A,t,SNR_ratio);
    inverse_part = inv(R_t_over_sigma_square+eye(Na*K));
    phi = 10*All_A{1}'*inverse_part*All_A{1};
end





