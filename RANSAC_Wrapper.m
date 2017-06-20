function [H_ransac] = RANSAC_Wrapper(matches, fittingfn, distfn, degenfn, s, t, feedback, maxDataTrials, maxTrials)

p1(:,i) = [matches(1, i) matches(2, i) 1];
p2(:,i) = [matches(3, i) matches(4, i) 1];

%[p1, T1] = normalizePoints(p1);
%[p2, T2] = normalizePoints(p2);

[H_ransac, inliers] = ransac([x1; x2], fittingfn, distfn, degenfn, s, t, feedback, ...
                               maxDataTrials, maxTrials);

%H_ransac = fittingfn(p1(:,inliers), p2(:,inliers));

%H_ransac = T2\H*T1;    


                           
end            
                        