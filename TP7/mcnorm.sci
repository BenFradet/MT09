function[z] = mcnorm(A, y)
    exec('resolChol.sci', -1);

    z = resolChol(A' * A, A' * y);
endfunction
