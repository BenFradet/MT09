function[x] = solsup(u, b)

// computes the solution of ux = b where u is a upper triangular matrix
[n m] = size(u);
if n <> m
    error('not a squared matrix');
end

[n2 un] = size(b);
if n2 <> n | un <> 1
    error('wrong dimensions for b');
end

for i = 1:n
    for j = 1:i - 1
        if u(i, j) <> 0
            error('not a upper triangular matrix');
        end
    end
end

for i = 1:n
    if u(i, i) - floor(u(i, i)) <> 0
        error('diagonal terms cant ben null');
    end
end

x = zeros(n, 1)
for i = n:-1:1
    x(i) = (b(i) - sum(u(i, i + 1:n) * x(i + 1:n))) / u(i,i);
end

endfunction
