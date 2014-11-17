function[x, k] = newton(foncjac, tol, Kmax, x0)
    
    if Kmax - floor(Kmax) ~= 0 | Kmax < 0
        error('Kmax must be an int');
    end

    if tol < 0 | abs(tol) < %eps
        error('wrong tol');
    end

    for k = 1:Kmax
        [f, J] = foncjac(x0);
        correction = J\-f;
        x = x0 + correction;
        if (norm(x - x0) / norm(x)) < tol
            return x;
        else
            x0 = x;
        end
    end

    error('didnt converge');
    
endfunction
