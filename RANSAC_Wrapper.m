function [H_ransac] = RANSAC_Wrapper(matches, fittingfn, distfn, degenfn, s, t, feedback, maxDataTrials, maxTrials)

[H_ransac inliers] = ransac(matches, fittingfn, distfn, degenfn, s, t, feedback, ...
                               maxDataTrials, maxTrials);
end            
                        