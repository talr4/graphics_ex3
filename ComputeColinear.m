% ISCOLINEAR - are 3 points colinear
%
% Usage:  r = iscolinear(p1, p2, p3, flag)
%
% Arguments:
%        p1, p2, p3 - Points in 2D or 3D.
%        flag       - An optional parameter set to 'h' or 'homog'
%                     indicating that p1, p2, p3 are homogneeous
%                     coordinates with arbitrary scale.  If this is
%                     omitted it is assumed that the points are
%                     inhomogeneous, or that they are homogeneous with
%                     equal scale.
%
% Returns:
%        r = 1 if points are co-linear, 0 otherwise

% Copyright (c) 2004-2005 Peter Kovesi
% School of Computer Science & Software Engineering
% The University of Western Australia
% http://www.csse.uwa.edu.au/
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in 
% all copies or substantial portions of the Software.
%
% The Software is provided "as is", without warranty of any kind.

% February 2004
% January  2005 - modified to allow for homogeneous points of arbitrary
%                 scale (thanks to Michael Kirchhof)


function b = iscolinear(x1, x2, x3)
	b =  norm(cross(x2-x1, x3-x1)) < eps;
    
    