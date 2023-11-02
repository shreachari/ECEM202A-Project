% fp = fopen('temp.txt','w');
% fprintf(fp, "{");
% for i = 1:1:length(candidate_data)
%     fprintf(fp, "{");
%     fprintf(fp, "%f,%f", real(candidate_data(i)), imag(candidate_data(i)));
%     fprintf(fp, "}");
%     if i~=length(candidate_data)
%         fprintf(fp, ",");
%     end
% end
% fprintf(fp, "}");
% fclose(fp);

fp = fopen('temp.txt','w');
fprintf(fp, "{");
for i = 1:1:length(candidate_data)
%     fprintf(fp, "{");
    fprintf(fp, "%.16f", candidate_data(i));
%     fprintf(fp, "}");
    if i~=length(candidate_data)
        fprintf(fp, ",");
    end
end
fprintf(fp, "}");
fclose(fp);