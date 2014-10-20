function[] = trace(N, T, cc)

exec('calcg.sci', -1);

if N - floor(N) <> 0 | N <= 0
    error('N has to be int > 0');
end

t = linspace(1, 6, N);
gt = zeros(1, N);

for i = 1:N
    gt(i) = calcg(t(i), T, cc);
end

plot(t, gt);

endfunction
