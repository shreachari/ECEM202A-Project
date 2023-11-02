% rootpath = "~/Desktop/uwb_vibration_eavesdropping/matlab/sample_raw_data/";
rootpath = "~/Desktop/UWHear_breath/matlab/unprocessed/";
destpath = "~/Desktop/UWHear_breath/matlab/unprocessed/";
filelist = dir(rootpath);
for i = 3:length(filelist)
    filepath = rootpath + filelist(i).name;
    bb_frames = read_file_into_matrix(filepath);
    temp = split(filelist(i).name,".");
    save(destpath + temp(1) +".mat")
end
