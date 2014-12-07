function[z] = rungeKutta4(a, t0, T, N, f)
    if T < t0 | abs(T) < %eps
        error('invalid T');
    end

    if N - floor(N) ~= 0 | N < 0
        error('invalid N');
    end

    [n un] = size(a);
    if un ~= 1
        error('invalid a');
    end

    h = T / N;
    z = zeros(n, N);
    tt = 0;
    zz = a;
    for i = 1:N
        k1 = f(tt, zz);
        k2 = f(tt + h / 2, zz + h * k1 / 2);
        k3 = f(tt + h / 2, zz + h * k2 / 2);
        k4 = f(tt + h, zz + h * k3);
        zz = zz + h / 6 * (k1 + 2 * k2 + 2 * k3 + k4);
        z(:, i) = zz;
        tt = tt + h;
    end
endfunction
