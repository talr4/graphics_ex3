function [H, inliers_indices] = RANSAC_Wrapper(matches, fittingfn, distfn, degenfn, s, t, feedback, maxDataTrials, maxTrials)
        
    numberOfPoints = size(matches, 2);
    for i = 1 : numberOfPoints
      x1(:,i) = [matches(1, i) matches(2, i) 1];
      x2(:,i) = [matches(3, i) matches(4, i) 1];
    end

    [x1, T1] = normalizePoints(x1);
    [x2, T2] = normalizePoints(x2);

    [H, inliers_indices] = ransac([x1; x2], fittingfn, distfn, degenfn, s, t, feedback, maxDataTrials, maxTrials);
        
    x1 = x1(:,inliers_indices);
    x2 = x2(:,inliers_indices);
    numberOfInliers = size(x1, 2);
    
    for i = 1 : numberOfInliers
        matches_inliers(:,i) = [ x1(1, i) x1(2, i) x1(3, i) x2(1,i) x2(2,i) x2(3,i) ];
    end
    
    H = fittingfn(matches_inliers);
    
    % Denormalise
    H = T2\H*T1;    
    
