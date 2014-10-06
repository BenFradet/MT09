function[x] = suite(N, a, b)

if (N - floor(N) ~= 0) | N < 0
    error('erreur dans suite: N non entier positif ou nul');
end

if N == 0
    x = a;
elseif N == 1
    x = b;
else
    x = zeros(N, 1);
    x(1) = a;
    x(2) = b;
    for i = 1:N-2
        x(i+2) = 9/4 * x(i + 1) - 1/2 * x(i);
    end
end

endfunction        
