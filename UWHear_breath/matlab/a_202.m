filepath = "./Data/10-24-test-3.txt";

bb_frames = read_file_into_matrix(filepath);

%% phase calculation
% tgt_bin = bb_frames(:,16);
% tgt_bin = phase(tgt_bin);
% figure()
% plot(tgt_bin)


%% I amplitude and Q amplitude
bb_frames = [real(bb_frames), imag(bb_frames)];

figure()
mesh(bb_frames)

for target_bin = 11:13 % search I
    candidate_data = bb_frames(:,target_bin);
    figure()
    plot(candidate_data)
    title(num2str(target_bin))
end

for target_bin = 11+40:13+40 % search Q
    candidate_data = bb_frames(:,target_bin);
    figure()
    plot(candidate_data)
    title(num2str(target_bin-40))
end
%% Try filtering
% Raw signal, in-phase
target_bin = 12;
candidate_data = bb_frames(:,target_bin);
% figure()
% plot(candidate_data)
% title(num2str(target_bin))

% Raw signal, quardrature
% target_bin = 16+40;
% candidate_data = bb_frames(:,target_bin);
% figure()
% plot(candidate_data)
% title(num2str(target_bin))

% Median Filter
y = medfilt1(candidate_data, 5);
figure()
plot(y)
title(num2str(target_bin))

% low pass FIR filter
[Hd, b] = lpf_breath_10fs; 
temp = filtfilt(b,1,candidate_data);
figure()
plot(temp)