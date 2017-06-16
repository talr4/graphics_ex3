function [normalizedPoints T] = normalizePoints(points)

numberOfPoints = size(points, 2);

for i = 1 : numberOfPoints
   points(1,i) = points(1,i)/points(3,i);
   points(2,i) = points(2,i)/points(3,i);
   points(3,i) = points(3,i)/points(3,i);
    
end

centeroid(1) = mean(points(1,:));
centeroid(2) = mean(points(2,:));

%translation
T1 = [1 0 -centeroid(1); ...
      0 1 -centeroid(2); ...
      0 0 1];
       
normalizedPoints = T1*points;

for i = 1 : numberOfPoints    
    dist(i) = sqrt(normalizedPoints(1,i)^2 + normalizedPoints(2,i)^2);
end

meandist = mean(dist(:));
    
scale = sqrt(2)/meandist;

%scale
T2 = [scale 0 0; ...
      0 scale 0; ...
      0 0 1];
normalizedPoints = T2*normalizedPoints;  

T = T2*T1;

end