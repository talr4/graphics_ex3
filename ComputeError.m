function [error] = ComputeError(pnts_gt,pnts_computed)
error = 0;
n = size(pnts_gt);
for i = 1 : n
    %un-homegonize the points
    x1 = pnts_gt(i, 1)/pnts_gt(i, 3);
    y1 = pnts_gt(i, 2)/pnts_gt(i, 3);
    x2 = pnts_compute(i,1)/pnts_compute(i,3);
    y2 = pnts_computed(i,2)/pnts_compute(i,3);
    
    distace = abs(sqrt((x2-x1)^2+(y2-y1)^2));
    
    error = error + distace;
end