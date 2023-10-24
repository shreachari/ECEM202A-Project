rootpath = "./";
filelist = dir(rootpath);
for i = 3:length(filelist)
    filepath = rootpath + filelist(i).name;
    if(length(strfind(filepath, "idle")))
        csvread(filepath);
        ans = ans - mean(ans);
        figure()
        stft((ans),1000,'Window',hamming(256, "periodic"),'OverlapLength',192,'FFTLength',256);
    end
end


