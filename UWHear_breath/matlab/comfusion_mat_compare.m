c = [709,61,1,0,0,0,0,0,0;11,606,0,0,0,0,0,0,0;4,38,885,0,0,0,0,0,0;0,0,0,762,9,0,0,0,0;0,0,0,43,1037,0,0,0,0;0,0,0,0,0,463,0,0,0;0,0,0,0,0,0,155,0,0;0,0,0,0,0,0,0,154,0;0,0,0,0,0,0,0,0,154];
confusionchart(c, 'Normalization',"row-normalized")
% for i = 1:size(c,1)
%     for j = 1:size(c,2)
%         c(i,j) = int64(c(i,j)/sum(c(i,:))*1000);
%     end
% end

c1 = [[558,   0,   0,   1,   1,  49,   8],
       [  0, 155,   0,   0,   0,   0,   0],
       [  0,   0, 154,   0,   0,   0,   0],
       [  0,   0,   0, 154,   0,   0,   0],
       [ 20,   0,   0,   0, 871,  36,   0],
       [ 48,   0,   0,   0,   0, 513,  56],
       [ 94,   0,   0,   0,   0,  46, 940]];
figure()
confusionchart(c1, 'Normalization',"row-normalized")

% numlabels = size(confmat, 1); % number of labels
% % calculate the percentage accuracies
% confpercent = 100*confmat./repmat(sum(confmat, 1),numlabels,1);
% % plotting the colors
% imagesc(confpercent);
% ylabel('Output Class'); xlabel('Target Class');
% % set the colormap
% colormap(flipud(gray));
% % Create strings from the matrix values and remove spaces
% textStrings = num2str(confpercent(:), '%.1f%\n%d\n');
% textStrings = strtrim(cellstr(textStrings));
% % Create x and y coordinates for the strings and plot them
% [x,y] = meshgrid(1:numlabels);
% hStrings = text(x(:),y(:),textStrings(:), ...
%     'HorizontalAlignment','center', 'FontSize', 38);
% % Get the middle value of the color range
% midValue = mean(get(gca,'CLim'));
% % Choose white or black for the text color of the strings so
% % they can be easily seen over the background color
% textColors = repmat(confpercent(:) > midValue,1,3);
% set(hStrings,{'Color'},num2cell(textColors,2));