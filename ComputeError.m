function [error] = ComputeError(pnts_gt,pnts_computed)
error = 0;
n = size(pnts_gt);
for i = 1 : n
    %un-homegonize the points
    x1 = pnts_gt(1, i)/pnts_gt(3, i);
    y1 = pnts_gt(2, i)/pnts_gt(3, i);
    x2 = pnts_computed(1,i)/pnts_computed(3, i);
    y2 = pnts_computed(2,i)/pnts_computed(3, i);
    
    distace = sqrt((x2-x1)^2+(y2-y1)^2);
    
    error = error + distace;
end