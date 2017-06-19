function [H] = DLT_V2(matches)

numberOfPoints = size(matches, 2);

for i = 1 : numberOfPoints
   p1(:,i) = [matches(1, i) matches(2, i) 1];
   p2(:,i) = [matches(3, i) matches(4, i) 1];
end

[p1, T1] = normalizePoints(p1);
[p2, T2] = normalizePoints(p2);



a = [];
n =  size(p1,2);
for i= 1 : n
    x2 = p2(1,i);
    y2 = p2(2,i);
    z2 = p2(3,i);
    p = p1(:,i)';
    zero = zeros(3,1)';
    a(2*i-1,:) = [zero -z2*p y2*p];
    a(2*i,:) = [z2*p zero -x2*p];
end

% Obtain the SVD of A. The unit singular vector corresponding to the
% smallest singular value is the solucion h. A = UDV' with D diagonal with
% positive entries, arranged in descending order down the diagonal, then h
% is the last column of V.
[u,d,v] = svd(a);

H = reshape(v(:,9),3,3)';

% Desnormalization
H = inv(T2)*H*T1;



end
