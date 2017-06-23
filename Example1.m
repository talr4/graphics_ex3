Im = 'left.pgm'
Im_shear = 'left_shear.pgm' 
H=[1 .2 0; .1 1 0; 0.5 0.2 1]
[TranformedIm] = ComputeProjective(Im, H)
imwrite(TranformedIm,Im_shear)
[num_matches,matches,dist_vals] = match(Im,Im_shear,0.5)
displayedCorr = DisplayCorr(Im,Im_shear,matches,dist_vals,10)
H_no_ransac = DLT(matches)
[pnts_gt,pnts_computed] = ComputeTestPoints(H,H_no_ransac')
error_no_ransac = ComputeError(pnts_gt,pnts_computed)
H_ransac = RANSAC_Wrapper(matches,@DLT,@homogdist2d,@isdegenerate,4,0.1,0,100,1000);
[pnts_gt,pnts_computed] = ComputeTestPoints(H,H_ransac')
error_ransac = ComputeError(pnts_gt,pnts_computed)
sprintf('DLT error: %d. DLT with RANSAC error: %d error:',error_no_ransac,error_ransac);