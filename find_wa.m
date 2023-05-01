


function [wa] = find_wa(All_A,t,SNR_ratio,Na,K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    R_t_over_sigma_square = get_Rt_over_sigma(All_A,t,SNR_ratio);
    inverse_part = inv(R_t_over_sigma_square+eye(Na*K));
    wa = (inverse_part*All_A{1}*t)/(t'*All_A{1}'*inverse_part*All_A{1}*t);
end






function [sum] = get_Rt_over_sigma(All_A,t,SNR_ratio)
%     DISP("fidnig Rt");
    len = length(All_A);
    ttH = t*t';
    for i=2:len
        
        A_thetaM = All_A{i};
        A_hermM = A_thetaM';
        if i==2
            sum = SNR_ratio*A_thetaM*ttH*A_hermM;
        else
            sum = sum+ SNR_ratio*A_thetaM*ttH*A_hermM;
        end
    end
end
