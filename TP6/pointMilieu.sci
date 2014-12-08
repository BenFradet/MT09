function[z] = pointMilieu(a, t0, T, N, f)

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
    tt = t0;
    zz = a;
    for i = 1:N
        k1 = f(tt, zz);
        k2 = f(tt + h / 2, zz + h * k1 / 2);
        zz = zz + h * k2;
        z(:, i) = zz;
        tt = tt + h;
    end

endfunction
