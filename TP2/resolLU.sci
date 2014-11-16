function[x] = resolLU(a, b)

    exec('factorLU2.sci', -1);
    exec('solsup.sci', -1);
    exec('solinf.sci', -1);

    [l u] = factorLU(a);
    y = solinf(l, b);
    x = solsup(u, y);

endfunction
