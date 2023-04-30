function [e23b] = get_e23b(ii,Gamma_dB,K,Na,h_i,T,N_o)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);


% Qk = getQk(Na,h_i,k,K);
if(ii==1)
   val=2;
else
   val=1; 
end
   
summed_part = trace(getQk(Na,h_i,val,K)*T); 
e23b = (1/gamma_i)*trace(getQk(Na,h_i,ii,K)*T) - summed_part - N_o; %part of eq(23b) for ii


end
