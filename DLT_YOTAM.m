function [H] = DLT_YOTAM(matches)
n = length(matches);

numberOfPoints = size(matches, 2);

for i = 1 : numberOfPoints
   points1(:,i) = [matches(1, i) matches(2, i) 1];
   points2(:,i) = [matches(3, i) matches(4, i) 1];
end


x_mean = mean(points1(:,1));
y_mean = mean(points1(:,2));
avg = mean(sqrt(diag(points1*points1')));
T = [avg 0 -x_mean*avg ; 0 avg -y_mean*avg ; 0 0 1];


x_mean = mean(points2(:,1));
y_mean = mean(points2(:,2));
avg = mean(sqrt(diag(points2*points2')));
T_tag = [avg 0 -x_mean*avg ; 0 avg -y_mean*avg ; 0 0 1];

points1(3,:)=1;
points1 = T*points1;

points2(3,:)=1;
points2 = T_tag*points2;

A = zeros(2*n,9);

for i=1:n
    A(2*i-1,4:6) = -points2(3,i)*points1(:,i);
    A(2*i-1,7:9) = points2(2,i)*points1(:,i);
    A(2*i,1:3) = points2(3,i)*points1(:,i);
    A(2*i,7:9) = -points2(1,i)*points1(:,i);
end

[U,S,V] = svd(A);
H = reshape(V(:,9),3,3)';


H = inv(T_tag)*H*T;

end