function [pnts_gt,pnts_computed] = ComputeTestPoints(H_gt,H_computed)
X = []
for i = 1:100
    for j = 1:100
        X = [X [i j 1]'];
    end
end
pnts_gt = H_gt*X;
pnts_computed = H_computed*X;