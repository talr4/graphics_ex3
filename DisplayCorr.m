function [displayedCorr] = DisplayCorr(image1, image2, matches, dist_vals, x)

im1 = imread(image1);
im2 = imread(image2);
image3 = appendimages(im1,im2);

cols1 = size(image1,2);

for i = 1 : x
   position = [matches(i,1) matches(i,2) ; matches(i,3)+cols1 matches(i,4)];
   result = insertText(image3,position,i,'FontSize',18, ...
       'TextColor','red');
   displayedCorr(i) = matches(i);
end



figure('Position', [100 100 size(image3,2) size(image3,1)]);
imshow(result);

end