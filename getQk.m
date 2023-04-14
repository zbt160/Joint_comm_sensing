function [Qk] = getQk(Na,hi,k,K)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Jk = getJi(Na,K,k);
Qk = Jk'*conj(hi)*hi.'*Jk;


end

