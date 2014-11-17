function[] = courbe()
    r = 2;
    a = linspace(0, 2 * %pi, 100);
    x = r * cos(a);
    y = r * sin(a);
    plot(x, y);
    x = linspace(-2, 2, 100);
    y = exp(x);

    gc = gca();
    gc.isoview = 'on';
    plot(x, y);
endfunction
