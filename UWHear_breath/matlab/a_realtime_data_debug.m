% close all;clear all;clc
raw_iq = csvread("~/Desktop/data_debug/jason_03.csv");
% raw_iq = raw_iq(1:16000, :);
[timesteps, iqs] = size(raw_iq);
bb_frames = raw_iq(:,1:iqs/2) + 1j.* raw_iq(:,1+iqs/2:iqs);
bb_frames = phase_noise_correction(bb_frames, 1);

bb_frames = abs(bb_frames);
figure()
mesh(bb_frames)

bb_frames = stationary_clutter_suppression(bb_frames);

figure()
mesh(bb_frames)

figure()
plot(var(bb_frames))

[object_inx, target_bin] = vibrating_target_localization(bb_frames);

candidate_data = bb_frames(:,target_bin);
figure()
stft((candidate_data),1000,'Window',hamming(256, "periodic"),'OverlapLength',192,'FFTLength',256);