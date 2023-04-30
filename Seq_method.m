clear all;
close all; clc;

Na = 10;
K = 2;
k=1;
ii=1;
% h_i = gethi(Na); 
% Qk = getQk(Na,h_i,k,K);
Gamma_dB = 15; % dB
delta = 0.5; % This is a placeholder and need to consult because did not find the value in the paper 


SNR_ratio_INR = (10^2);
Po_dBm = 30;%dBm
No_dBm = 10;
P_o = 10^(Po_dBm/10) * 0.001;
N_o =  10^(Po_dBm/10) * 0.001;
t = ones(Na*K,1)%/sqrt(K*P_o*Na);
T=t*t';

theta = 30;
h_i = gethi(Na); 
%Hi = get_Hi(ii,Gamma_dB,K,Na,h_i,T,N_o);
Theta_values = [0 -75 -30 30 75];
% getting all As for the angles
len_interferences = length(Theta_values);
All_A = {};
for ii =1:len_interferences
   All_A{ii} =  get_A(K,Theta_values(ii),delta,Na);
end

er_th = 0.001;



phi_o = find_phi(All_A,t,SNR_ratio_INR,Na,K);   %finding phi
gam_snr_o = real(trace(phi_o*T));
%Rw_over_sigma = get_Rw_over_sigma(All_A,wa,SNR_ratio_INR);
%Z_over_sigma  = Rw_over_sigma + (wa'*wa)/P_o; 
%Omega = real(10*All_A{1}*wa*wa'*All_A{1}');

%%% Remember to change the channel h_i for each path
%% CVX Problem setup
H1 = get_e23b(1,Gamma_dB,K,Na,h_i,T,N_o); %part of eq(23b) for ii=1
H2 = get_e23b(2,Gamma_dB,K,Na,h_i,T,N_o); %part of eq(23b) for ii=2

tol = 10^3;
current1 = real(trace(phi_o*T)) ;

diff_abs = tol+1;
count = 0;

while(diff_abs > tol)
    count = count+1;
    if(count>100)
        break;
    end
    cvx_begin sdp

        %     cvx_solver_settings('maxiter', 1000, 'tolerance', 1e-6)
        variable T(Na*K,Na*K) symmetric
    
        maximize( real(trace(phi_o*T)) )
        subject to
            T >= 0;
            real(H1) >= 0;
            real(H2) >= 0;
            trace(T) == P_o;
    cvx_end

    L_ch = chol(T, 'lower');
    [V,D]=eig(T);
    % Extract the vector a from the Cholesky decomposition
    %t = L_ch(:,1);
    t = V(:,end);
    % threshold condition
    %T=t*t';
    %
    prev= current1 ;
    
    phi_o = find_phi(All_A,t,SNR_ratio_INR,Na,K);   %finding phi
    %gam_snr_1 = real(trace(phi_o*T));
    current1 = real(trace(phi_o*T)) ;
    diff_abs = abs(current1 - prev);

end
%error_t = abs(gam_snr_1-gam_snr_o);

%if error_t < er_th
%    break;
%end

T_decomp = t*t';
% Compute A as the product of a and its Hermitian transpose


disp('Optimal t');
disp(t);
%[U,S,V] = svd(X/y);
%t = U(:,1);


%%%% There can be something wrong with a'. Matlab might be taking a
%%%% transpose but not comjugate so need to confirm that.

