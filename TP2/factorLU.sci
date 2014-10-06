function[l, u] = factorLU(a)

[n m] = size(a);
if n <> m
    error('not a squared matrix');
end

u = zeros(n, n);
l = zeros(n, n);

for i = 1:n - 1
    for j = i:n
        u(i, j) = a(i, j) - sum(l(i, 1:i - 1) * u(1:i - 1, j))
    end

    for j = i + 1:n
        if abs(u(i, i)) < %eps
            error('diagonal terms cant be null');
        else
            l(j, i) = (a(j, i) - sum(l(j, 1:i - 1) * u(1:i - 1, i))) / u(i, i);
        end
    end
end

u(n, n) = a(n, n) - sum(l(n, 1:n - 1) * u(1:n - 1, n));

endfunction
