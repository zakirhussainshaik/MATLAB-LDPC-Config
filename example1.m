% This script provides an example to demonstrate usage of the function
% MATLAB (supported from 2021b)

% Author: Zakir Hussain Shaik

% Communication standard supported WLAN
% Code-Rates supported 1/2, 2/3, 3/4, and 5/6
% Codeword-lengths supported: 648, 1296, and 1944, default is 648
% Standard supported: wlan

% Supported decoding algorithms as per MATLAB documentation: 'bp','layered-bp','norm-min-sum','offset-min-sum'

clc;
clear;
close all;

%% Inputs
rate = 1/2; % code rate

M = 4; % M - QAM
snrdB = 10; % SNR in dB

maxnumiter = 50; % Number of iterations for LDPC decoder

%%
% Obtaining config variables from the function
[cfgLDPCEnc,decodercfg] = generateConfigLDPC(rate);

% Number of message bits
k = cfgLDPCEnc.NumInformationBits; 

% Message/Iformation bits
infoBits = randi([0 1],k,1); 

% LDPC encoded bits
encData = ldpcEncode(infoBits,cfgLDPCEnc); 

% Modulating the bits using QAM constellation
modSignal = qammod(encData,M,'InputType','bit','UnitAveragePower',true);

% Received signal under AWGN channel
receivedSignal = awgn(modSignal,snrdB);

% Computing the effective noise variance for given snr
noiseVar = 1/10^(snrdB/10);

% Computing soft estimate i.e., llr
bitsllr = qamdemod(receivedSignal,M,'OutputType','llr','UnitAveragePower',true,'NoiseVariance',noiseVar);

% Decoding the bits
decodBits = ldpcDecode(bitsllr,decodercfg,maxnumiter);

% Computing number of errors incurred
numErrs = sum(xor(infoBits,decodBits));

fprintf('Number of bits in error: %d\n',numErrs);