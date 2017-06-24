function nx = hnormalise(x)
    
    [rows,npts] = size(x);
    nx = x;
    finiteind = find(abs(x(rows,:)) > eps);

    % Normalise points not at infinity
    for r = 1:rows-1
        nx(r,finiteind) = x(r,finiteind)./x(rows,finiteind);
    end
    
    nx(rows,finiteind) = 1;
    