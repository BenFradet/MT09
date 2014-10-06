function[u, e] = trisup(a, b)

[n m] = size(a);
if n <> m
    error('not a squared matrix');
end

[n2 un] = size(b);
if n2 <> n | un <> 1
    error('wrong dimensions for b');
end

for k = 1:n - 1
    if abs(a(k, k)) < %eps
        error('diagonal terms cant be null');
    else
        for i = k + 1:n
            c = a(i, k) / a(k, k);
            b(i) = b(i) - c * b(k);
            a(i, k) = 0;
            for j = k + 1:n
                a(i, j) = a(i, j) - c * a(k, j);
            end
        end
    end
end

if abs(a(n, n)) < %eps
    error('diagonal terms cant be null');
end

u = a
e = b

endfunction
