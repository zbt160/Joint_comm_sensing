


function [phi] = find_phi(All_A,t,SNR_ratio,Na,K)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    R_t_over_sigma_square = get_Rt_over_sigma(All_A,t,SNR_ratio);
    inverse_part = inv(R_t_over_sigma_square+eye(Na*K));
    phi = 10*All_A{1}'*inverse_part*All_A{1};
end






function [rt] = get_Rt_over_sigma(All_A,t,SNR_ratio)
%     DISP("fidnig Rt");
    len = length(All_A);
    ttH = t*t';
    for jj=1:len
        
        A_thetaM = All_A{jj};
        A_hermM = A_thetaM';
        if jj==1
            rt = SNR_ratio*A_thetaM*ttH*A_hermM;
        else
            rt = rt+ SNR_ratio*A_thetaM*ttH*A_hermM;
        end
    end
end