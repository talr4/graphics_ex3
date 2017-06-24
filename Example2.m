% conver image to pgm
ImToConvert = 'v.jpg';
Im = 'v.pgm';
Im_shear = 'v_shear.pgm' ;
X = imread(ImToConvert);
imwrite(X, Im);

% compute projective transformation
H=[1 .2 0; .1 1 0; 0.5 0.2 1];
[TranformedIm] = ComputeProjective(Im, H);
imwrite(TranformedIm,Im_shear);

% find matches
[num_matches,matches,dist_vals] = match(Im,Im_shear,0.5);
displayedCorr = DisplayCorr(Im,Im_shear,matches,dist_vals,10);

% execute DLT and estimate his error
H_no_ransac = DLT(matches);
[pnts_gt,pnts_computed] = ComputeTestPoints(H,H_no_ransac');
error_no_ransac = ComputeError(pnts_gt,pnts_computed);

% execute RANSAC and estimate his error
H_ransac = RANSAC_Wrapper(matches,@DLT,@homogdist2d,@isdegenerate,4,0.000001,0,100,5000);
[pnts_gt,pnts_computed] = ComputeTestPoints(H,H_ransac');
error_ransac = ComputeError(pnts_gt,pnts_computed);

% compute RANSAC improvment
improvementRate = (1-(error_ransac/error_no_ransac))*100;
if improvementRate < 0.0001 && improvementRate > -0.0001 
    improvementRate = 0;
end

% print error results
display(['DLT error without RANSAC: ' num2str(error_no_ransac) '.' ]);
display(['DLT error with RANSAC: ' num2str(error_ransac) '.' ]);
display(['Improvement rate: ' num2str(improvementRate) '%.' ]);
