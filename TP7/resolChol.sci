function[x] = resolChol(A, b)
    exec('cholesky.sci', -1);
    exec('solsup.sci', -1);
    exec('solinf.sci', -1);

    C = cholesky(A);
    y = solinf(C, b);
    x = solsup(C', y);
endfunction
