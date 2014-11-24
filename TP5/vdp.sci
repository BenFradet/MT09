function[y] = vdp(t, x)
    c = 0.4;
    y = [x(2); c * (1 - x(1) ^ 2) * x(2) - x(1)];
endfunction
