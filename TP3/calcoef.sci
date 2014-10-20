function[cc] = calcoef(T, y)

exec('cald.sci', -1);

[one n] = size(T);
if one <> 1
    error('T not a vector');
end

[one ny] = size(y);
if one <> 1 | ny <> n
    error('y not the right dims');
end

[d h] = cald(T, y);

cc = zeros(n - 1, 4);
cc(:, 1) = y(1:n - 1)';
cc(:, 2) = d(1:n - 1)';
for i = 1:n - 1
    cc(i, 3) = (y(i + 1) - y(i)) / (h(i) ^ 2) - d(i) / h(i);
    cc(i, 4) = (d(i + 1) + d(i)) / (h(i) ^ 2) - ...
                2 * (y(i + 1) - y(i)) / (h(i) ^ 3);
end

endfunction
