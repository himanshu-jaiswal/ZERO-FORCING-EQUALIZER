%%%  *IMPLEMENTATION OF ZERO FORCING EQUALIZER*
% Himanshu Jaiswal	
% B.tech Student  (ECE)
% Vellore Institute of Technology

%% Input initialization
clc
close all
clear all

N = 10^4     % number of bits or symbols
ip = rand(N,1)>0.5;  % generating 0,1 with equal probability

%% Choosing the modulation techniques
for j = 1:3
 
if j == 1
    [mod,demod] = fsk();
    type = ' FSK ';
elseif j== 2
    [mod,demod] = bpsk();
    type = ' BPSK ';
else
    [mod,demod] = qpsk();
    type = ' QPSK ';
end

s = step(mod,ip);

Eb_N0_dB = [-3:35]; % multiple Eb/N0 values

%% Noise addition , equalization and error calculation
for i = 1:length(Eb_N0_dB)
   
   n = 1/sqrt(2)*[randn(length(s),1) + j*randn(length(s),1)]; % white gaussian noise, 0dB variance 
   h = 1/sqrt(2)*[randn(length(s),1) + j*randn(length(s),1)]; % Rayleigh channel
   
   % Channel and noise Noise addition
   y = h.*s + 10^(-Eb_N0_dB(i)/20)*n;
   %y = h.*s;

   % equalization
   yHat = y./h;
   %yHat = equ(y);

   op = step(demod,yHat);
   
   % counting the errors
   nErr(i) = size(find([ip-op]),1);

end

%% BER CALCULATION

simBer = nErr/N; % simulated ber
%theoryBerAWGN = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber
EbN0Lin = 10.^(Eb_N0_dB/10);
theoryBer = 0.5.*(1-sqrt(EbN0Lin./(EbN0Lin+1)));

%% Figures
% plot
figure(j)
%semilogy(Eb_N0_dB,theoryBerAWGN,'cd-','LineWidth',2);
hold on
semilogy(Eb_N0_dB,theoryBer,'bp-','LineWidth',2);
semilogy(Eb_N0_dB,simBer,'mx-','LineWidth',2);
axis([-3 35 10^-5 0.5])
grid on
legend('Rayleigh-Theory', 'Rayleigh-Simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
head = strcat('BER for',type,'modulation in Rayleigh channel using Zero Forcing' );
title(head);
%figure()
%plot(op)
end
%% Function setup
%{
% for BPSK
function [mod,demod] = bpsk()
mod = comm.BPSKModulator();
demod = comm.BPSKDemodulator();
end

% for fsk
function [mod,demod] = fsk()
mod = comm.FSKModulator();
demod = comm.FSKDemodulator();
end

% for qpsk

function [mod,demod] = qpsk()
mod = comm.QPSKModulator();
mod.BitInput = true;
demod = comm.QPSKDemodulator();
demod.BitOutput = true;
end
%}
