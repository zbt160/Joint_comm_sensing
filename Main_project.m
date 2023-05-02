clear all;
close all; clc;

Na = 10;
K = 2;
k=1;
i=1;
% h_i = gethi(Na); 
% Qk = getQk(Na,h_i,k,K);
Gamma_dB = 6; % dB
delta = 0.5; % This is a placeholder and need to consult because did not find the value in the paper 


theta = 30;
h_1 = gethi(Na); 
h_2 = gethi(Na); 

% Hi = get_Hi(i,Gamma_dB,K,Na,h_i);
Theta_values = [0 -75 -30 30 75];
% getting all As for the angles
len_interferences = length(Theta_values);
All_A = {};
for i =1:len_interferences
   All_A{i} =  get_A(K,Theta_values(i),delta,Na);
end


SNR_ratio_INR = (10^2);
Po_dBm = 30;%dBm
No_dBm = 10;
P_o = 10^(Po_dBm/10) * 0.001;
t = 0.01*ones(Na*K,1)/sqrt(K*P_o*Na);

T=t*t';

N_o =  10^(Po_dBm/10) * 0.001;


wa = find_wa(All_A,t,SNR_ratio_INR,Na,K);
Rw_over_sigma = get_Rw_over_sigma(All_A,wa,SNR_ratio_INR);
Z_over_sigma  = Rw_over_sigma + (wa'*wa)/P_o; 
Omega = 10*All_A{1}*wa*wa'*All_A{1}';

y = real(1/(trace(Z_over_sigma*T)));
X= y*T;

%%% Remember to change the channel h_i for each path
%% CVX Problem setup
H1 = get_Hi(1,Gamma_dB,K,Na,h_1,h_2);
H2 = get_Hi(2,Gamma_dB,K,Na,h_2,h_1);

cvx_begin sdp
    cvx_solver('sdpt3');
%     cvx_solver_settings('maxiter', 1000, 'tolerance', 1e-6)
    variable X(Na*K,Na*K) symmetric 
%     variable y(1)
    maximize( real(trace(Omega*X) ))
    subject to
%         real(X)>=0;
%         y>=0;
        X == semidefinite(Na*K);
        trace(Z_over_sigma*X) == 1; % This might have problem since we are deviding by simga_a^2
        real(trace(H1*X))>=y*N_o;
        real(trace(H2*X))>= y*N_o;
        real(trace(X)) == y*P_o;
cvx_end

% [U,S,V] = svd(X/y);
% t = U(:,1);


%%%% There can be something wrong with a'. Matlab might be taking a
%%%% transpose but not comjugate so need to confirm that.


