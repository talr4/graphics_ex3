function [best] = computeXBestMatches(matches, dist_vals, x)


[values, indexs] = sort(dist_vals);
for i = 1 : x
   best(:,i) = [matches(1, indexs(i)) matches(2, indexs(i)) matches(3, indexs(i)) matches(4, indexs(i))];

end

end