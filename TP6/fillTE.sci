function[TE] = fillTE(a, t0, T)
    exec('fillTV.sci', -1);

    deff('[x] = f(t)', 'x = 3 / 2 * exp(-t) - 1 / 2 * cos(t) + 1 / 2 * sin(t)');

    TE = abs(f(T) - fillTV(a, t0, T));
endfunction
