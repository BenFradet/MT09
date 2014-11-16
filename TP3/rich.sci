function[x] = rich(a, b, c, u)
    //richtmayer's algorithm for solving tridiag matrices

    [one na] = size(a);
    if one <> 1
        error('a not a vector');
    end

    [one nb] = size(b);
    if one <> 1 | nb <> na + 1
        error('b not the right dims');
    end

    [one nc] = size(c);
    if one <> 1 | nc <> na
        error('c not the right dims');
    end

    [one nu] = size(u);
    if one <> 1 | nu <> nb
        error('u not the right dims');
    end

    // best way to compute A
    // A = diag(a, -1) + diag(b) + diag(c, 1);

    n = nu
    a = [0, a];
    x = zeros(1, n);
    e = zeros(1, n - 1);
    f = zeros(1, n);

    if abs(b(1)) < %eps
        error('b(1) cant be null');
    end

    e(1) = - c(1) / b(1);
    f(1) = u(1) / b(1);

    for i = 2:n - 1
        den = a(i) * e(i - 1) + b(i);
        if abs(den) < %eps
            error('a(i) * e(i - 1) + b(i) cant be null');
        else
            e(i) = - c(i) / den;
            f(i) = (u(i) - a(i) * f(i - 1)) / den;
        end
    end

    // x(n) = f(n)
    den = a(n) * e(n - 1) + b(n);
    if abs(den) < %eps
        error('a(n) * e(n - 1) + b(n) cant be null');
    else
        x(n) = (u(n) - a(n) * f(n - 1)) / den;
    end

    for i = n - 1:-1:1
        x(i) = e(i) * x(i + 1) + f(i);
    end

endfunction
