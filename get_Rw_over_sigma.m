function [Rw] = get_Rw_over_sigma(All_A,wa,SNR_ratio)
%     DISP("fidnig Rt");
    len = length(All_A);
    ttH = wa*wa';
    for i=1:len
        
        A_thetaM = All_A{i};
        A_hermM = A_thetaM';
        if i==1
            Rw = SNR_ratio*A_hermM*ttH*A_thetaM;
        else
            Rw = Rw+ SNR_ratio*A_hermM*ttH*A_thetaM;
        end
    end
end