% Algorithm reference https://www.mathworks.com/matlabcentral/answers/243730-implementing-filtfilt-using-filter

%%%%%% flip-3x 
load('washing_256pts.mat');
[Hd, b] = hpf_20_70; % high pass FIR, stop at 20 pass at 100
templates = filtfilt(b,1,candidate_data);

sig_after_phase_noise_correction = candidate_data;
sig_raw = sig_after_phase_noise_correction;
sig_len = length(candidate_data);
sig_ext = zeros(3*sig_len, 1);

for i = 1:sig_len
    sig_ext(i) = sig_raw(sig_len-i+1);
end

for i = 1:sig_len
    sig_ext(i+sig_len) = sig_raw(i);
end
    
for i = 1:sig_len
    sig_ext(i+sig_len*2) = sig_raw(sig_len-i+1);
end

forward_filt = filter(b,1,sig_ext);
fliped_sig = zeros(3*sig_len, 1);
for i = 1:3*sig_len
    fliped_sig(i) = forward_filt(3*sig_len-i+1);
end
backward_filt = filter(b,1,fliped_sig);
for i = 1:3*sig_len
    fliped_sig(i) = backward_filt(3*sig_len-i+1);
end
filtered_sig = fliped_sig(sig_len+1:sig_len*2);

plot(filtered_sig)
hold on
plot(templates)
figure()
plot(abs(fft(templates)))
hold on
plot(abs(fft(filtered_sig)))



%%%%% flip-3x-2
% load('washing_256pts.mat');
% [Hd, b] = hpf_20_70; % high pass FIR, stop at 20 pass at 100
% templates = filtfilt(b,1,candidate_data);
% 
% sig_after_phase_noise_correction = candidate_data;
% sig_raw = sig_after_phase_noise_correction;
% sig_len = length(candidate_data);
% sig_ext = zeros(3*sig_len-2, 1);
% 
% for i = 1:sig_len
%     sig_ext(i) = sig_raw(sig_len-i+1);
% end
% 
% for i = 1:sig_len
%     sig_ext(i+sig_len-1) = sig_raw(i);
% end
% 
% for i = 1:sig_len
%     sig_ext(i+sig_len*2-2) = sig_raw(sig_len-i+1);
% end
% 
% forward_filt = filter(b,1,sig_ext);
% fliped_sig = zeros(3*sig_len-2, 1);
% for i = 1:3*sig_len-2
%     fliped_sig(i) = forward_filt(3*sig_len-2-i+1);
% end
% backward_filt = filter(b,1,fliped_sig);
% for i = 1:3*sig_len-2
%     fliped_sig(i) = backward_filt(3*sig_len-2-i+1);
% end
% filtered_sig = fliped_sig(sig_len:sig_len*2-1);
% 
% plot(filtered_sig)
% hold on
% plot(templates)
% figure()
% plot(abs(fft(templates)))
% hold on
% plot(abs(fft(filtered_sig)))




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% On-time Filtering


% load('washing_256pts.mat');
% [Hd, b] = hpf_20_70; % high pass FIR, stop at 20 pass at 100
% templates = filtfilt(b,1,candidate_data);
% 
% 
% filter_size = 85;
% sig_padded = [zeros(filter_size,1)' candidate_data']';
% % sig_padded = candidate_data;
% filtered_sig = filter(b,1,sig_padded);
% % filtered_sig = filtered_sig(86:end);
% figure()
% plot(abs(fft(templates)))
% hold on
% plot(abs(fft(filtered_sig)))