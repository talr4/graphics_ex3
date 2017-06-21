function [H] = DLT(matches)

s = size(matches)         % Extract x1 and x2 from x
if (s(1,1) == 6)
    p1 = matches(1:3,:);    
    p2 = matches(4:6,:); 
else
    numberOfPoints = size(matches, 2);
    for i = 1 : numberOfPoints
      p1(:,i) = [matches(1, i) matches(2, i) 1];
      p2(:,i) = [matches(3, i) matches(4, i) 1];
    end
end
[x1, T1] = normalizePoints(p1);
[x2, T2] = normalizePoints(p2);

Npts = length(x1);
a = zeros(3*Npts,9); 
O = [0 0 0];
for n = 1:Npts
    X = x1(:,n)';
    x = x2(1,n); y = x2(2,n); w = x2(3,n);
    a(3*n-2,:) = [  O  -w*X  y*X];
    a(3*n-1,:) = [ w*X   O  -x*X];
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
