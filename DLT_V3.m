function [H] = DLT_V3(matches)

numberOfPoints = size(matches, 2);

for i = 1 : numberOfPoints
   p1(:,i) = [matches(1, i) matches(2, i) 1];
   p2(:,i) = [matches(3, i) matches(4, i) 1];
end

[x1, T1] = normalise2dpts(p1);
[x2, T2] = normalise2dpts(p2);

    Npts = length(x1);
    A = zeros(3*Npts,9);
    
    O = [0 0 0];
    for n = 1:Npts
	X = x1(:,n)';
	x = x2(1,n); y = x2(2,n); w = x2(3,n);
    
	A(3*n-2,:) = [  O  -w*X  y*X];
	A(3*n-1,:) = [ w*X   O  -x*X];
	A(3*n  ,:) = [-y*X  x*X   O ];
    end
    
    [U,D,V] = svd(A,0); % 'Economy' decomposition for speed
    
    % Extract homography
    H = reshape(V(:,9),3,3)';
    
    % Denormalise
    H = T2\H*T1;

end
