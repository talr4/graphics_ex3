function [ TransformedImage ] = ComputeProjective( Im, H )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I = imread(Im);
tform = projective2d(H);
TransformedImage = imwarp(I,tform);
imshow(TransformedImage);

end

