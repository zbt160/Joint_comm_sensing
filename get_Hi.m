function [Hi] = get_Hi(i,Gamma_dB,K,Na,h_i)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);


% Qk = getQk(Na,h_i,k,K);
if(i==1)
   val=2;
else
   val=1; 
end
   
summed_part = getQk(Na,h_i,val,K); 
Hi = (1/gamma_i)*getQk(Na,h_i,i,K) - summed_part;


end

