function[x] = resolG(a, b)

exec('trisup.sci', -1);
exec('solsup.sci', -1);

[u e] = trisup(a, b);
x = solsup(u, e);

endfunction
