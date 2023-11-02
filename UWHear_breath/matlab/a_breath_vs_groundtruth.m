raw_iq = csvread("~/Desktop/data_debug/jason_03.csv");
% raw_iq = raw_iq(1:16000, :);
[timesteps, iqs] = size(raw_iq);
bb_frames = raw_iq(:,1:iqs/2) + 1j.* raw_iq(:,1+iqs/2:iqs);
bb_frames = abs(phase_noise_correction(bb_frames, 1));

target_bin = 25; 
candidate_data = bb_frames(:,target_bin);
[imf,residual,info] = vmd(candidate_data, 'NumIMFs',4);
new_sig = imf(:,4);
new_sig = new_sig - mean(new_sig);
% plot(new_sig)
uwb_sig = new_sig;

raw_wave = csvread("~/Desktop/NeuLog_20220518/Jason_03_data.csv");
% plot(raw_wave(:,2))
figure()
t = 0:0.05:59.99;
downsampled = downsample(uwb_sig, 50);
downsampled = downsampled(1100-3:2299-3);
gnd = raw_wave(1100:2299, 2);
gnd = self_centralize(gnd, 1);
downsampled = self_centralize(downsampled, 1);
plot(t, gnd, "LineWidth", 4)
hold on
plot(t, downsampled, "LineWidth", 4)
legend("Ground Truth", "Capricorn")
xlabel("Time/s")
% figure
% plot(downsample(self_centralize(uwb_sig, 1),50))
% hold on
% plot(self_centralize(raw_wave(:,2),1))
% 
% [c,lags] = xcorr(self_centralize(raw_wave(1:5899,2),1),downsample(self_centralize(uwb_sig, 1),50));
% stem(lags,c)