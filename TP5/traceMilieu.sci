function[] = traceMilieu(a, t0, T, N)
    exec('pointMilieu.sci', -1);
    exec('vdp.sci', -1);

    x = pointMilieu(a, t0, T, N, vdp);

    theta = zeros(1:N);
    h = T / N;
    for i = 1:N
        theta(i) = t0 + i * h;
    end
    y = ode(a, t0, theta, vdp);

    plot(x(1, :), x(2, :), 'r');
    plot(y(1, :), y(2, :), 'b');
endfunction
