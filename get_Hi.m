function [Hi] = get_Hi(i,Gamma_dB,K,Na,ha,hb)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

gamma_i = 10^(Gamma_dB/10);



if(i==1)
   val=2;
   Hi = (1/gamma_i)*getQk(Na,ha,i,K) + getQk(Na,ha,val,K); 
else
   val=1; 
   Hi = (1/gamma_i)*getQk(Na,hb,i,K) + getQk(Na,hb,val,K); 
   
end


end

