function [displayedCorr] = DisplayCorr(image1, image2, matches, dist_vals, x)

im1 = imread(image1);
im2 = imread(image2);
image3 = appendimages(im1,im2);


cols1 = size(im1,2);
result = image3;
[values, indexs] = sort(dist_vals);
for i = 1 : x
   position = [matches(indexs(i),1) matches(indexs(i),2) ; matches(indexs(i),3)+cols1 matches(indexs(i),4)];
   result = insertText(result,position,i,'FontSize',18, ...
       'TextColor','red', 'BoxOpacity',0);
   displayedCorr(i) = matches(i);
end

figure('Position', [100 100 size(result,2) size(result,1)]);
imshow(result);



end