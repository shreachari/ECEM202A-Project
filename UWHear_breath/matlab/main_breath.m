% filepath = "/home/ziqi/Desktop/uwb_sound_data/collected_data_20200509/400_75_1500_tune2.txt"; 
% bb_frames = read_file_into_matrix(filepath);
% or
% load("./sample_raw_data/washing_machine.mat");
% close all;clear;clc;

% correct for sampling clock jitter
bb_frames = phase_noise_correction(bb_frames, 1);

% decimation
bb_frames_new = [];
for i = 1:size(bb_frames, 2)
   bb_frames_new = [bb_frames_new decimate((bb_frames(:,i)), 10)]; 
end

for i = 1:size(bb_frames, 2)
   bb_frames_new(:,i) = bb_frames_new(:,i) - mean(bb_frames_new(:,i)); 
end

%%%%%%%%%%%%%%%%%%%%%%
% For Akash: it is a 0.9(pass) - 1.7(stop) FIR LPF
bb_frames = stationary_clutter_suppression2(bb_frames_new);
% Warning: if Fs changed , filters need to be adjusted

% Remove DC
% bb_frames_new = abs(bb_frames);
% for i = 1:size(bb_frames_new, 2)
%    bb_frames_new(:,i) = bb_frames_new(:,i) - mean(bb_frames_new(:,i)); 
% end
bb_frames_new = bb_frames;

figure()
mesh(abs(bb_frames_new))
target_bin = 23; % look for peaks and manually select a bin

% take slices
candidate_data = bb_frames_new(:,target_bin);
% discard the fist samples because of FIR
candidate_data = candidate_data(320:end);
% normalize the data between +-1
candidate_data = self_centralize(abs(candidate_data), 1);

% fft analysis
% Fs = 1000;            % Sampling frequency 
% figure
% Fs = 100;
% T = 1/Fs;             % Sampling period
% L = size(bb_frames_new, 1); % Length of signal
% t = (0:L-1).*T;        % Time vector
% f = Fs*(0:(round(L/2)))/L;
% 
% Y = fft(abs(candidate_data));
% P2 = abs(Y);  % P2 = abs(Y/L);
% P1 = P2(1:round(L/2)+1);
% P1(2:end-1) = 2*P1(2:end-1);
% figure()
% plot(f,P1)
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For Akash: might need to change the algorithms here for breath estmataion
findpeaks(candidate_data, 'MinPeakDistance',40,'MinPeakProminence', 0.1)
[pks,locs] = findpeaks(candidate_data, 'MinPeakDistance',40,'MinPeakProminence', 0.1);
meanCycle = mean(diff(locs));
bpm = 100/meanCycle*60;

figure()
Fs = 100;
T = 1/Fs;             % Sampling period
L = size(bb_frames_new, 1); % Length of signal
t = (0:L-1).*T;        % Time vector
f = Fs*(0:(round(L/2)))/L;

Y = fft(abs(candidate_data));
P2 = abs(Y);  % P2 = abs(Y/L);
P1 = P2(1:round(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
figure()
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')% % stft analysis
xlim([0.1,1])
% figure()
% stft((candidate_data),Fs,'Window',hamming(256, "periodic"),'OverlapLength',192,'FFTLength',256);
% 
% % distance_estimation (only calculated for range 0.3 to 4.3m setting)
% range_min = 0.3;
% range_max = 6.36;
% if target_bin > 120
%     distance = range_min + 0.0514*(target_bin-121);
% else
%     distance = range_min + 0.0514*(target_bin-1);
% end
% fprintf("The estimated vibration target distance is %f m.\n", distance);
