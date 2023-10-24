close all
bb_frames = phase_noise_correction(bb_frames, 1);

target_bin = 30; % 18 for person 1, 32 for person 2
                 % 53 for person 1, 31 for person 1

candidate_data = bb_frames(:,target_bin);
sig_amp = abs(candidate_data);

% base = 5000;
% sig_amp = sig_amp(base+1:base+500*30);

% sig_amp = preemphasis(sig_amp, 0.97);
% sig_amp = self_centralize(sig_amp, 1);

[imf,residual,info] = vmd(sig_amp, 'NumIMFs',4);
new_sig = imf(:,4);
new_sig = new_sig - mean(new_sig);
% new_sig = self_centralize(new_sig, 1);
plot(new_sig)

% new_sig = sig_amp;

Fs = 1000;
T = 1/Fs;             % Sampling period
L = size(new_sig, 1); % Length of signal
t = (0:L-1).*T;        % Time vector
f = Fs*(0:(round(L/2)))/L;

Y = fft(new_sig);
P2 = abs(Y);  % P2 = abs(Y/L);
P1 = P2(1:round(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
figure()
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')% % stft analysis
xlim([0.1,1])

for idx = 1:length(f)
    if f(idx) > 0.13
        break
    end
end
        
P1 = P1(idx:end);
f = f(idx:end);
[val, loc] = max(P1);
bpm = f(loc) * 60
% plot_values_over_time(new_sig, 1)  
% new_sig = imf(:,2);
% vmd(new_sig ,'NumIMFs',3);
% vmd(sig_amp)