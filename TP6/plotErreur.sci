function[] = plotErreur()
    exec('fillTE.sci', -1);
    
    a = 1;
    t0 = 0;
    T = 10;

    TE = fillTE(a, t0, T);
    TE = -log(TE);
    Ns = [10; 100; 1000; 10000];
    Ns = log(Ns);

    plot(Ns, TE(:, 1), 'r');
    plot(Ns, TE(:, 2), 'b');
    plot(Ns, TE(:, 3), 'k');

    [a b] = reglin(Ns, TE(:, 1));
    [a b] = reglin(Ns, TE(:, 2));
    [a b] = reglin(Ns, TE(:, 3));
endfunction
