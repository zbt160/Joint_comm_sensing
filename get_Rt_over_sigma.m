
function [rt] = get_Rt_over_sigma(All_A,t,SNR_ratio)
%     DISP("fidnig Rt");
    len = length(All_A);
    ttH = t*t';
    for jj=2:len
        
        A_thetaM = All_A{jj};
        A_hermM = A_thetaM';
        if jj==2
            rt = SNR_ratio*A_thetaM*ttH*A_hermM;
        else
            rt = rt+ SNR_ratio*A_thetaM*ttH*A_hermM;
        end
    end
end