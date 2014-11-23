function[C] = cholesky(A)
    [n n2] = size(A);
    if n ~= n2
        error('not a squared matrix');
    end

    C = zeros(n, n);
    for j = 1:n - 1
        srt = A(j, j) - sum(C(j, 1:j - 1) .^ 2);
        if srt < 0
            error('sqrt < 0');
        end
        C(j, j) = sqrt(srt);
        if abs(C(j, j)) < %eps
            error('diag elem = 0');
        end
        for i = j + 1:n
            C(i, j) = 1 / C(j, j) * (A(i, j) - ...
                sum(C(i, 1:j - 1) * C(j, 1:j - 1)));
        end
    end
    srt = A(n, n) - sum(C(n, 1:n - 1) .^ 2);
    if srt < 0
        error('sqrt < 0');
    end
    C(n, n) = sqrt(srt);
endfunction
