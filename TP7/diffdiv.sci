function [f] = diffdiv(y, t)
    [m n] = size(y);
    [p q] = size(t);

    if m ~= p | n ~= q | n ~= 1
        error('inconsistent dims');
    end

    f = zeros(m, n);

    for k = 0:m
        f(k) = y(k);
    end

    for k = 1:m
        for i = m:-1:k
            if (t(i) - t(i - k)) == 0
                error('dividing by 0');
            end
            f(i) = (f(i) - f(i - 1)) / (t(i) - t(i - k));
        end
    end
endfunction
