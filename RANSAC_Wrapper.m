function [H_ransac] = RANSAC_Wrapper(matches, fittingfn, distfn, degenfn, s, t, feedback, maxDataTrials, maxTrials)

    numberOfPoints = size(matches, 2);

    for i = 1 : numberOfPoints
      x1(:,i) = [matches(1, i) matches(2, i) 1];
      x2(:,i) = [matches(3, i) matches(4, i) 1];
    end

    [x1, T1] = normalise2dpts(x1);
    [x2, T2] = normalise2dpts(x2);

[H_ransac, inliers] = ransac([x1; x2], fittingfn, distfn, degenfn, s, t);

    H = fittingfn(x1(:,inliers), x2(:,inliers));
    % Denormalise
    H = T2\H*T1;  


                           
end            
                        