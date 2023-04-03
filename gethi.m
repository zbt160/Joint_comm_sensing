function [h] = gethi(Na)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% Na = Numebr of active array antennas


% Define the number of samples to generate
N = Na;

% Generate complex-valued samples from a Gaussian distribution with zero mean and unit variance
h = (1/sqrt(2)) * (randn(N, 1) + 1i * randn(N, 1));

% Plot the real and imaginary parts of the generated samples
% figure;
% subplot(2,1,1);
% plot(real(h));
% xlabel('Sample index');
% ylabel('Real part');
% subplot(2,1,2);
% plot(imag(h));
% xlabel('Sample index');
% ylabel('Imaginary part');

end

