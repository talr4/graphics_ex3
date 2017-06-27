
function [num_matches,matches,dist_vals] = match(image1, image2, distRatio)

% Find SIFT keypoints for each image
[im1, des1, loc1] = sift(image1);
[im2, des2, loc2] = sift(image2);

% For each descriptor in the first image, select its match to second image.
des2t = des2'; % Precompute matrix transpose
num_matches = 0;
matches = [];
dist_vals = [];
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;        % Computes vector of dot products
   [vals,indx] = sort(acos(dotprods));  % Take inverse cosine and sort results
   % Check if nearest neighbor has angle less than distRatio times 2nd.
   if (vals(1) < distRatio * vals(2))
      num_matches = num_matches + 1;
      match(i) = indx(1);
      dist_vals(num_matches) = vals(1) / vals(2);
      matches(:, num_matches) = [loc1(i,2) loc1(i,1) loc2(match(i),2) loc2(match(i),1)];
   else
      match(i) = 0;
   end
   
end


end



