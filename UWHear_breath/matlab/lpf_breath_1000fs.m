function [Hd,b] = lpf_breath_1000fs
%LPF_BREATH_1000FS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.9 and DSP System Toolbox 9.11.
% Generated on: 16-Nov-2021 18:10:07

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fpass = 0.9;             % Passband Frequency
Fstop = 1.7;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
