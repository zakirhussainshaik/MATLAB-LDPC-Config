% This code package contains a helper function generateConfigLDPC() which generates LDPC config struct variables in 
% the format supported by ldpcEncode() and ldpcDecode() functions of
% MATLAB (supported from 2021b)

https://se.mathworks.com/matlabcentral/fileexchange/103360-matlab-ldpc-config

% This function is intended for those who wants to use LDPC coding function without having to worry about
% parity check matrices and details. Currently LDPC codes from WLAN standard are supported in this function.

% Author: Zakir Hussain Shaik
% Contact: zakir.b2a@gmail.com

% This function is version 1.0
% License: This code is licensed under the GPLv2 license.

% This function outputs two outputs
% First output : cfgLDPCEnc
% Second output: decodercfg 
% These variables can be directly used with MATLAB functions ldpcEncode() and ldpcDecode() as per their corresponding syntaxes

% This function accepts minimum one and maximum four inputs where three inputs are
% optional.
% First input  : rate -- code rate (Mandtory Input)
% Second input : codeword length (If given must be second input)
% Third input  : 'standard'-- 'wlan' (this input is name-value type)
% Fourth input : 'decoderAlgo' -- decoding algorithm (this input is name-value type)

% Second, third and fourth inputs are optional. However, if codeword length
% is provided as input it should be in the second argument only.
% Third and fourth arguments are of name-value format and can be given in
% any order

% Default values: standard is 'wlan', code word length is 648, decoder algorithm is 'bp'

% Supported stanadard: 'wlan'
% Supported rates: 1/2, 2/3, 3/4, and 5/6
% Supported codeword lengths: 648, 1296, and 1944
% decoderAlgo takes four algorithms as stated in MATLAB site: {'bp','layered-bp','norm-min-sum','offset-min-sum'}

% This file is accompanied with example scripts

% Following syntaxes are supported:

% Example 1:
% rate = 1/2;
% [cfgLDPCEnc,decodercfg] = generateConfigLDPC(rate,'decoderAlgo','bp');

% Example 2:
rate = 1/2;
n = 1944;
[cfgLDPCEnc,decodercfg] = generateConfigLDPC(rate,n,'decoderAlgo','norm-min-sum');

% Example 3:
rate = 1/2;
n = 1944;
[cfgLDPCEnc,decodercfg] = generateConfigLDPC(rate,n,'decoderAlgo','norm-min-sum','standard','wlan');

% Example 4
rate = 3/4; % code rate
n = 1296; % Codeword length
decodAlgo = 'offset-min-sum'; % LDPC decoding algorithm
[cfgLDPCEnc,decodercfg] = generateConfigLDPC(rate,n,'decoderAlgo',decodAlgo,'standard','wlan');

