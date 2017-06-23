function r = isdegenerate(x)

    x1 = x(1:3,:);    % Extract x1 and x2 from x
    x2 = x(4:6,:);    
    
    r = ...
    ComputeColinear(x1(:,1),x1(:,2),x1(:,3)) | ...
    ComputeColinear(x1(:,1),x1(:,2),x1(:,4)) | ...
    ComputeColinear(x1(:,1),x1(:,3),x1(:,4)) | ...
    ComputeColinear(x1(:,2),x1(:,3),x1(:,4)) | ...
    ComputeColinear(x2(:,1),x2(:,2),x2(:,3)) | ...
    ComputeColinear(x2(:,1),x2(:,2),x2(:,4)) | ...
    ComputeColinear(x2(:,1),x2(:,3),x2(:,4)) | ...
    ComputeColinear(x2(:,2),x2(:,3),x2(:,4));