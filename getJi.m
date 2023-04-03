function [Ji] = getJi(Na,K,i)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% K = Targets
% Na = number of active array antennas
% i = ith Users , i can take the values from 1 to K

Ji = [zeros(Na,Na*(i-1)) eye(Na) zeros(Na,Na*(K-i))];

end

