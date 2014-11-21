function[] = courbe2()

    exec('foncjac2.sci', -1);
    exec('newton.sci', -1);

    n1 = 10;
    n2 = 20;

    a = 5;
    be = 5;
    
    x8 = ones(1:n1 - 2)';
    [v1 k] = newton(foncjac2, 10^-8, 1000, x8);
    x18 = ones(1:n2 - 2)';
    [v2 k] = newton(foncjac2, 10^-8, 1000, x18);

    v1 = [a; v1; be];
    v2 = [a; v2; be];

    h1 = 1 / n1;
    h2 = 1 / n2;
    x1 = ones(1:n1)';
    x2 = ones(1:n2)';
    for i = 1:n1
        x1(i) = i * h1;
    end
    for i = 1:n2
        x2(i) = i * h2;
    end

    plot(x1, v1, 'r');
    plot(x2, v2, 'b');

endfunction
