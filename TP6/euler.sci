function[z] = euler(a, t0, T, N, f)
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
        zz = zz + h * f(tt, zz);
        z(:, i) = zz;
        tt = tt + h;
    end
endfunction
