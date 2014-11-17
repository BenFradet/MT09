function[f, J] = foncjac(x)
    J = [2 * x(1), 2 * x(2); -exp(x(1)), 1];
    f = [x(1) ^ 2 + x(2) ^ 2 - 4; x(2) - exp(x(1))];
endfunction
