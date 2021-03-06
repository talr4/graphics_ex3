function [displayedCorr] = DisplayCorr(image1, image2, matches, dist_vals, x)

%read images
im1 = imread(image1);
im2 = imread(image2);
image3 = appendimages(im1,im2);

%insert text
cols1 = size(im1,2);
result = image3;
[values, indexs] = sort(dist_vals);
for i = 1 : x
   position = [matches(1, indexs(i)) matches(2, indexs(i)) ; matches(3, indexs(i))+cols1 matches(4, indexs(i))];
   result = insertText(result,position,i,'FontSize',18, ...
       'TextColor','red', 'BoxOpacity',0);
   displayedCorr(i) = matches(i);
end

%show the image
figure('Position', [100 100 size(result,2) size(result,1)]);
imshow(result);



end