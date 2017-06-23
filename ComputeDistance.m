function [inliers, H] = homogdist2d(H, x, t);
    
    x1 = x(1:3,:);   % Extract x1 and x2 from x
    x2 = x(4:6,:);       
    Hx1    = H*x1;
    
    x1     = normalizePoints(x1);
    x2     = normalizePoints(x2);     
    Hx1    = normalizePoints(Hx1);
    
    d2 = sum((x2-Hx1).^2);
    inliers = find(abs(d2) < t);  