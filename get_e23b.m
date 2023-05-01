function [e23b] = get_e23b(ii,Gamma_dB,K,Na,ha,hb,T,N_o)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);


% Qk = getQk(Na,h_i,k,K);
if(ii==1)
   val=2;
%     ha=h_2;
%     hb=h_1;
else
   val=1; 
%    ha=h_1;
%    hb=h_2;
end

summed_part = trace(getQk(Na,ha,val,K)*T); 
 

e23b = (1/gamma_i)*trace(getQk(Na,hb,ii,K)*T) - summed_part - N_o; %part of eq(23b) for ii


end
