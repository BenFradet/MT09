function[A] = construct(t, tau)
    m = length(tau);
    n = length(t);

    A = zeros(m, n);
    for i = 1:m
        for j = 1:n - 1
            if tau(i) >= t(j) & tau(i) <= t(j + 1)
                A(i, j) = (tau(i) - t(j + 1)) / (t(j) - t(j + 1));
                A(i, j + 1) = (tau(i) - t(j)) / (t(j + 1) - t(j));
            end
        end
    end

endfunction
