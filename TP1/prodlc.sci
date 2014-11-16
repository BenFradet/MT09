function [res] = prodlc(A, l, c)

    [m n] = size(A);

    if (m <> n)
        error('erreur dans prodlc: matrice non carree');
    end

    if l > n | l < 0 | (l - floor(l) ~= 0)
        error('erreur dans prodlc: invalide l');
    end

    if c > n | c < 0 | (c - floor(c) ~= 0)
        error('erreur dans prodlc: invalide c');
    end

    res = A(l, :) * A(:, c);

endfunction
