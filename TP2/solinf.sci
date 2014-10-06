function[x] = solinf(l, b)

[n m] = size(l)
if n <> m
    error('not a square matrix');
end

[n2 un] = size(b);
if n2 <> n | un <> 1
    error('wrong dimensions for b');
end

for i = 1:n
    for j = i + 1:n
        if abs(l(i, j)) > %eps
            error('not a lower triangular matrix');
        end
    end
end

for i = 1:n
    if abs(l(i, i)) < %eps
        error('diagonal terms cant be null');
    end
end

x = zeros(n, 1);
for i = 1:n
    x(i) = (b(i) - sum(l(i, 1:i) * x(1:i))) / l(i, i);
end

endfunction
