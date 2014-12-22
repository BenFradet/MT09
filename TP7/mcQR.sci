function[z] = mcQR(A, y)
    exec('solsup.sci', -1);

    [m n] = size(A);
    [Q R] = qr(A);
    vec = Q' * y;
    c = vec(1:n);
    Rtilde = R(1:n, 1:n);
    disp(cond(Rtilde), 'conditionnement R tilde');
    z = solsup(R(1:n, 1:n), c);
endfunction
