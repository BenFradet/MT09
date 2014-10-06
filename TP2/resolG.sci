function[x] = resolG(a, b)

exec('trisup.sci');
exec('solsup.sci');

[u e] = trisup(a, b);
x = solsup(u, e);

endfunction
