function [Hi] = get_Hi(i,Gamma_dB,K,Na,ha,hb)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);


% Qk = getQk(Na,h_i,k,K);
if(i==1)
   val=2;
%     ha=h_2;
%     hb=h_1;
else
   val=1; 
%    ha=h_1;
%    hb=h_2;
end

   
summed_part = getQk(Na,ha,val,K); 
Hi = (1/gamma_i)*getQk(Na,hb,i,K) - summed_part;


end

