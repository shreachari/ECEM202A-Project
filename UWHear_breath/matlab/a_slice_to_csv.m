% rootpath = "~/Desktop/uwb_vibration_eavesdropping/matlab/sample_raw_data/";
rootpath = "~/Desktop/UWHear_breath/matlab/unprocessed/";
destpath = "~/Desktop/UWHear_breath/matlab/unprocessed/";
filelist = dir(rootpath);
for i = 3:length(filelist)
    filepath = rootpath + filelist(i).name;
    if (contains(filepath,"speed2_70") & contains(filepath,".mat") & ~contains(filepath,"wash"))
        load(filepath, "bb_frames");
        bb_frames = phase_noise_correction(bb_frames, 1);

        bb_frames = abs(bb_frames);

        bb_frames = stationary_clutter_suppression(bb_frames);

        [object_inx, target_bin] = vibrating_target_localization(bb_frames);
%         target_bin = 67;
        candidate_data = bb_frames(:,target_bin);
        
        figure()
        stft((candidate_data),1000,'Window',hamming(256, "periodic"),'OverlapLength',192,'FFTLength',256);
        title(string(filelist(i).name))
        
        new_filename = erase(filepath, ".mat") + ".csv";
        writematrix(candidate_data, new_filename)
        
    end
end
