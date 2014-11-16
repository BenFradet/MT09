function[l, u] = factorLU(a)

    [n m] = size(a);
    if n <> m
        error('not a squared matrix');
    end

    u = zeros(n, n);
    l = eye(n, n);

    for k = 1:n - 1
        if abs(a(k, k)) < %eps
            error('diagonal terms cant be null');
        else
            for i = k + 1:n
                l(i, k) = a(i, k) / a(k, k);
                a(i, k) = 0;
                for j = k + 1:n
                    a(i, j) = a(i, j) - l(i, k) * a(k, j);
                end
            end
        end
    end

    if abs(a(n, n)) < %eps
        error('diagonal terms cant be null');
    end

    u = a;

endfunction
