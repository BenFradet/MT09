function[TV] = fillTV(a, t0, T)

    if T < t0 | abs(T) < %eps
        error('invalid T');
    end

    [n un] = size(a);
    if un ~= 1
        error('invalid a');
    end

    exec('euler.sci', -1);
    exec('pointMilieu.sci', -1);
    exec('rungeKutta4.sci', -1);

    deff('[x] = f(t, u)', 'x = -u + sin(t)');

    TV = zeros(4, 3);
    for i = 1:4
        N = 10^i;
        xEuler = euler(a, t0, T, N, f);
        xPtMil = pointMilieu(a, t0, T, N, f);
        xRk4 = rungeKutta4(a, t0, T, N, f);
        TV(i, 1) = xEuler(N);
        TV(i, 2) = xPtMil(N);
        TV(i, 3) = xRk4(N);
    end

endfunction
