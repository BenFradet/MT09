function[y] = prothero(t, x)
    deff('[y] = g(x)', 'y = sin(%pi * x)');
    deff('[y] = gPrime(x)', 'y = %pi * cos(%pi * x)');

    q = -50;
    y = q * (x - g(t)) + gPrime(t);
endfunction
