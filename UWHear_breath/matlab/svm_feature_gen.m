bb_frames = phase_noise_correction(bb_frames, 1);

bb_frames = abs(bb_frames);

base = 4000;
target_bin = 56; %31 for vaccum, 56 for washing machine
candidate_data = bb_frames(base+1:base+256,target_bin);

% hold on
[Hd, b] = hpf_20_70; 
candidate_data = filtfilt(b,1,candidate_data);
% plot(candidate_data)
% temp = filter(b,1,[zeros(85,1)', candidate_data']');
% plot(temp(end-255:end))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% base = 5000;
% target_bin = 56; %31 for vaccum, 56 for washing machine
% candidate_data = bb_frames(base+1:base+256,target_bin);
% plot(candidate_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

norm_data = self_centralize(candidate_data,0);
data_fft = abs(fft(norm_data));
data_fft_half = data_fft (2:129);
feature = [];
for i=1:4:128
    feature = [feature max(data_fft_half(i:i+3))];
end

fprintf("{");
for i = 1:1:length(feature)
    fprintf("%.16f", feature(1,i)); 
    if i~=length(feature)
        fprintf(",");
    end
end
fprintf("}\n");

Fs = 1000;
T = 1/Fs;             % Sampling period
L = size(candidate_data, 1); % Length of signal
t = (0:L-1).*T;        % Time vector
f = Fs*(0:(round(L/2)))/L;

Y = fft(candidate_data);
P2 = abs(Y);  % P2 = abs(Y/L);
P1 = P2(1:round(L/2)+1);
P1(2:end-1) = 2*P1(2:end-1);
figure()
plot(f,P1)
% title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% ylabel('|P1(f)|')




