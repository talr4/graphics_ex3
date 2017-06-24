function [inliers, H] = ComputeDistance(H, x, t);
    
    x1 = x(1:3,:);   % Extract x1 and x2 from x
    x2 = x(4:6,:);       
    Hx1    = H*x1;
    invHx2 = H\x2;
    
    x1     = hnormalise(x1);
    x2     = hnormalise(x2);     
    Hx1    = hnormalise(Hx1);
    invHx2 = hnormalise(invHx2);

    
    d2 = sum((x2-Hx1).^2 + (x1-invHx2).^2);
    inliers = find(abs(d2) < t);  