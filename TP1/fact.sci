function[f] = fact(n)

if (n - floor(n) ~= 0) | n < 0
    error('erreur dans fact');
end

if n == 0
    f = 1;
else
    f = prod(1:n);
end

endfunction
