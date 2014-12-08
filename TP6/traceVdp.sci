function[] = traceVdp(a, t0, T, nEuler, nPtMil, nRk4, nOde)
    exec('vdp.sci', -1);
    exec('pointMilieu.sci', -1);
    exec('rungeKutta4.sci', -1);
    exec('euler.sci', -1);

    xPtMil = pointMilieu(a, t0, T, nPtMil, vdp);
    xRk4 = rungeKutta4(a, t0, T, nRk4, vdp);
    xEuler = euler(a, t0, T, nEuler, vdp);

    theta = zeros(1:nOde);
    h = T / nOde;
    for i = 1:nOde
        theta(i) = t0 + i * h;
    end
    xOde = ode(a, t0, theta, vdp);

    plot(xPtMil(1, :), xPtMil(2, :), 'r');
    plot(xRk4(1, :), xRk4(2, :), 'c');
    plo(xEuler(1, :), xEuler(2, :), 'k');
    plot(xOde(1, :), xOde(2, :), 'g');
endfunction
