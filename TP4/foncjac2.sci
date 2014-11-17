function[f, J] = foncjac2(v)
    alpha = 5;
    beta = 5;
    n = length(x);
    h = 1 / n;

    x = zeros(1:n - 1);
    for i = 1:n-1
        x(i) = i * h;
    end

    deff('[y] = g(x)', 'y = 10 .* x / (1 + x)');
    deff('[y] = b(x)', '-x .* (x - 1)');

    f = zeros(1:n - 1)';
    f(1) = -alpha + 2 * x(1) + h * h * g(v(1)) - v(2) - h * h * b(x(1));
    f(n - 1) = -v(n - 2) + 2 * v(n - 1) + h * h * g(v(n - 1)) - beta - ...
        h * h * b(x(n-1));
    f(2:n - 2) = -v(1:n-1) + 2 * v(2:n-2) + h * h * g(v(2:n - 2)) - ...
        v(3:n - 1) - h * h * b(x(2:n -2));

    ldiag = -ones(1:n-2)';
    d = ones(1:n - 1);
    d(1) = 2 + h * h * v(1) / (1 + v(1)) ^ 2;
    d(n - 1) = 2 + h * h * v(n - 1) / (1 + v(n - 1)) ^ 2;
    d(2:n - 2) = 2 * h * h * v(2:n - 2) / ((1 + v(2 : n - 2)) .^ 2);

    J = diag(ldiag, -1) + diag(d), + diag(ldiag, 1);
endfunction
