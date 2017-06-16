function [H] = DLT(matches)

numberOfPoints = size(matches, 1);

for i = 1 : numberOfPoints
   p1(:,i) = [matches(i,1) matches(i,2) 1]
   p2(:,i) = [matches(i,3) matches(i,4) 1]
end

[p1, T1] = normalizePoints(p1);
[p2, T2] = normalizePoints(p2);

x2 = p2(1,:);
y2 = p2(2,:);
z2 = p2(3,:);

a = [];
for i= 1 : size(p1,2)
    a = [a; zeros(3,1)'     -z2(i)*p1(:,i)'   y2(i)*p1(:,i)'; ...
            z2(i)*p1(:,i)'   zeros(3,1)'     -x2(i)*p1(:,i)'];
end

% Obtain the SVD of A. The unit singular vector corresponding to the
% smallest singular value is the solucion h. A = UDV' with D diagonal with
% positive entries, arranged in descending order down the diagonal, then h
% is the last column of V.
[u,d,v] = svd(a);

H = reshape(v(:,9),3,3)';

% Desnormalization
H = inv(T2) * H * T1;



end
