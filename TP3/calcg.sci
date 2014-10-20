function[z] = calcg(t, T, cc)

exec('place.sci', -1);

[one n] = size(T);
if one <> 1
    error('T not a vector');
end

[nMinusOne four] = size(cc);
if nMinusOne <> n - 1 | four <> 4
    error('cc not the right dims');
end

i = place(T, t);
tMinusTi = t - T(i);
tMinusTiSquared = tMinusTi ^ 2;
z = cc(i, 1) + ...
    cc(i, 2) * tMinusTi + ...
    cc(i, 3) * tMinusTiSquared + ...
    cc(i, 4) * tMinusTiSquared * (t - T(i + 1))

endfunction
