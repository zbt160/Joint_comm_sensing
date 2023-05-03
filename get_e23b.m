function [e23b] = get_e23b(ii,Gamma_dB,K,Na,ha,hb,T,N_o)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);


% Qk = getQk(Na,h_i,k,K);
if(ii==1)
   val=2;
   e23b = (1/gamma_i)*trace(getQk(Na,ha,ii,K)*T) + trace(getQk(Na,ha,val,K)*T)-N_o; 
else
   val=1; 
   e23b = (1/gamma_i)*trace(getQk(Na,hb,ii,K)*T) + trace(getQk(Na,hb,val,K)*T)-N_o; 
   
end




end
