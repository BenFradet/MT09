function[] = traceProthero(x0, t0, T, N)
    exec('pointMilieu.sci', -1);
    exec('prothero.sci', -1);

    deff('[y] = g(x)', 'y = sin(%pi * x)');

    x = pointMilieu(x0, t0, T, N, prothero);
    
    t = zeros(1:N);
    h = T / N;
    for i = 1:N
        t(i) = t0 + i * h;
    end
    y = ode(x0, t0, t, prothero);

    plot(t, x, 'r');
    plot(t, y, 'b');
endfunction
