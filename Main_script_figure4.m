clc;clear all;close all;
Po_dBm_array = [25,26,27,28,29,30];%dBm
N = length(Po_dBm_array);
% final_value_array = zeros(N,1);
% final_value_array_seq = zeros(N,1);
final_value_array_trbf = zeros(N,1);

for mm=1:N
    Po_dBm = Po_dBm_array(mm);
%     Upper_bound
%     final_value_array(mm) = final_value;
%     Seq_method
%     final_value_array_seq(mm) = fin_val;
    Main_project

    final_value_array_trbf(mm) = fin_TRBF;
    
end

% plot(Po_dBm_array,final_value_array,'+-')
% hold on;
% plot(Po_dBm_array,final_value_array_seq,'O-')
% hold on;
plot(Po_dBm_array,final_value_array_trbf,'*-')

ylabel('Output SINR of sensing [dB]')
xlabel('P_{o}[dBm]')
