function [ TransformedImage ] = ComputeProjective( Im, H )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I = imread(Im);
imshow(I);
T = maketform('projective',H);
TransformedImage = imtransform(I,T);

imshow(TransformedImage);

end

