function[C] = cholesky(A)
    [n n2] = size(A);
    if n ~= n2
        error('not a squared matrix');
    end

    C = zeros(n, n);
    for j = 1:n - 1
        C(j, j) = sqrt(A(j, j) - sum(C(j, 1:j - 1) .^ 2));
        for i = j + 1:n
            C(i, j) = 1 / C(j, j) * (A(i, j) - ...
                sum(C(i, 1:j - 1) * C(j, 1:j - 1)));
        end
    end
    C(n, n) = sqrt(A(n, n) - sum(C(n, 1:n - 1) .^ 2));
endfunction
