function[x, k] = newtonBDF(f, dfdx, tol, Kmax, x0, h, theta, U, V)
    if Kmax - floor(Kmax) ~= 0 | Kmax < 0
        error('Kmax must be an int');
    end

    if tol < 0 | abs(tol) < %eps
        error('wrong tol');
    end
endfunction
