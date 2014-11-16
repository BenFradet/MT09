function[x, k] = gaussSeidel(A, b, tol, Kmax, x0)

    [n m] = size(A);

    if length(b) ~= length(x0) | length(b) ~= n | n ~= m
        error('wrong dimensions');
    end

    if Kmax - floor(Kmax) ~= 0 | Kmax < 0
        error('Kmax must be an int');
    end

    if tol < 0 | abs(tol) < %eps
        error('wrong tol');
    end

    x = x0;

    for k = 1:Kmax
        for i = 1:n
            if abs(A(i, i)) < tol
                error('cant divide by 0');
            end
            x(i) = (1 / A(i, i)) * (b(i) - ...
                sum(A(i, 1:i - 1) * x(1:i - 1)) - ...
                sum(A(i, i + 1:n) * x(i + 1:n)));
        end

        if (norm(x - x0) / norm(x)) < tol
            return x;
        else
            x0 = x;
        end
    end

    error('didnt converge');

endfunction
