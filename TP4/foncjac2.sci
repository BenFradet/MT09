function[y] = g(x)
    y = 10 * x / (1 + x);
endfunction

function[y] = b(x)
    y = -x * (x - 1);
endfunction

function[f, J] = foncjac2(x)
    alpha = 5;
    beta = 5;
    n = length(x);
    h = 1 / n;

    x = zeros(1:n - 1);
    for i = 1:n-1
        x(i) = i * h;
    end

    f = zeros(1:n - 1)';
    f(1) = -alpha + 2 * x(1) + h * h * g(v(1)) - v(2) - h * h * b(x(1));
    f(n - 1) = -v(n - 2) + 2 * v(n - 1) + h * h * g(v(n - 1)) - beta - ...
        h * h * b(x(n-1));
    for i = 2:n - 2
        f(i) = -v(i - 1) + 2 * v(i) + h * h * g(v(i)) - v(i + 1) - ...
            h * h * b(x(i));
    end

    J = zeros(n - 1, n - 1);
    J(1, 1) = 2 + h * h * v(1) / (1 + v(1)) ^ 2;
    J(1, 2) = -1;
    J(n - 2, n - 1) = -1;
    J(n - 1, n - 1) = 2 + h * h * v(n - 1) / (1 + v(n - 1)) ^ 2;
    for i = 2:n - 2
        J(i, i - 1) = -1;
        J(i, i) = 2 * h * h * v(i) / (1 + v(i)) ^ 2;
        J(i, i + 1) = -1;
    end
endfunction

