% clear all;
% close all; clc;

Na = 10;
K = 2;


Gamma_dB = 15; % dB
delta = 0.5; % This is a placeholder and need to consult because did not find the value in the paper 


SNR_ratio_INR = (10^2);
% Po_dBm = 25;%dBm
No_dBm = 10;
P_o = 10^(Po_dBm/10) * 0.001;
N_o =  10^(No_dBm/10) * 0.001;
t = 0.1*ones(Na*K,1);%/sqrt(K*P_o*Na);
T=t*t';

theta = 30;
h_1 = gethi(Na); 
h_2 = gethi(Na); 

%Hi = get_Hi(ii,Gamma_dB,K,Na,h_i,T,N_o);
Theta_values = [0 -75 -30 30 75];
% getting all As for the angles
len_interferences = length(Theta_values);
All_A = {};
for ii =1:len_interferences
   All_A{ii} =  get_A(K,Theta_values(ii),delta,Na);
end

er_th = 0.001;



phi_o = find_phi(All_A,t,SNR_ratio_INR,Na,K,0);   %finding phi
gam_snr_o = real(trace(phi_o*T));

%%% Remember to change the channel h_i for each path
%% CVX Problem setup
H1 = get_e23b(1,Gamma_dB,K,Na,h_1,h_2,T,N_o); %part of eq(23b) for ii=1
H2 = get_e23b(2,Gamma_dB,K,Na,h_2,h_1,T,N_o); %part of eq(23b) for ii=2

tol = 10^(-3);
current1 = real(trace(phi_o*T)) ;

diff_abs = tol+1;

count = 0;
count_total =10;
diff_array = zeros(count_total,1);
while(diff_abs > tol)
% for i =1
    diff_array(count+1) = diff_abs;
    if(count>10)
        break;
    end
    cvx_begin sdp
        variable T(Na*K,Na*K) complex hermitian
        maximize( real(trace(phi_o*T)) )
        subject to
            T == semidefinite(Na*K);
            real(get_e23b(1,Gamma_dB,K,Na,h_1,h_2,T,N_o)) >= 0;
            real(get_e23b(2,Gamma_dB,K,Na,h_2,h_1,T,N_o)) >= 0;
            trace(T) == P_o;
    cvx_end

    [V,D]=eig(T);
    t = V(:,end);
    
    prev= current1 ;
    phi_o = find_phi(All_A,t,SNR_ratio_INR,Na,K,0);   %finding phi
    current1 = real(trace(phi_o*T)) ;
    diff_abs = abs(current1 - prev);
    count = count+1;

end

T_decomp = t*t';


disp('Optimal t');
disp(t);

final_value = 10*log10(current1);

