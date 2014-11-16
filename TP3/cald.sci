function[d, h] = cald(T, y)

    exec('rich.sci', -1);

    [one n] = size(T);
    if one <> 1
        error('T not a vector');
    end

    [one ny] = size(y);
    if one <> 1 | ny <> n
        error('y not the right dims');
    end

    h = zeros(1, n - 1);

    a = zeros(1, n - 1);
    b = zeros(1, n);
    c = zeros(1, n - 1);
    u = zeros(1, n);

    for i = 1: n - 1
        h(i) = T(i + 1) - T(i);
        if abs(h(i)) < %eps
            error('h(i) cant be null');
        else
            a(i) = 1 / h(i);
            c(i) = a(i);
            if i == 1
                b(i) = 2 / h(i);
                u(i) = 3 * (y(i + 1) - y(i)) / (h(i) ^ 2);
            else
                b(i) = 2 / h(i - 1) + 2 / h(i);
                u(i) = 3 * ((y(i) - y(i - 1)) / (h(i - 1) ^ 2) + ...
                        (y(i + 1) - y(i)) / (h(i) ^ 2));
            end
        end
    end
    b(n) = 2 / h(n - 1);
    u(n) = 3 * (y(n) - y(n - 1)) / (h(n - 1) ^ 2);

    d = rich(a, b, c, u);

endfunction
