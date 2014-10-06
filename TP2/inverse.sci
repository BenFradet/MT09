function[b] = inverse(a)

exec('resolG.sci', -1);

[m n] = size(a);
id = eye(n, n);
b = zeros(n, n);

for i = 1:n
    b(:, i) = resolG(a, id(:, i));
end

endfunction
