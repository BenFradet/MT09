function[] = trace(N, T, cc)

exec('place.sci', -1);

[one n] = size(T);
if one <> 1
    error('T not a vector');
end

[nMinusOne three] = size(cc)
if nMinusOne <> n - 1 | three <> 3
    error('cc not the right dims');
end

if N <= 0
    error('N must be greather than 0');
end

t = linspace(0, 4, N);
gt = zeros(1, N);

for i = 1:N
    index = place(T, t(i));
    gt(i) = cc(index, 1) + cc(index, 2) * t(i) + cc(index, 3) * t(i)^2;
end

plot(t, gt);

endfunction
