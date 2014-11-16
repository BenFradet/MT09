function[i] = place(T, t)

    [one n] = size(T);

    if one <> 1
        error('T not a vector');
    end

    if t < T(1) | t > T(n)
        error('t too large or too small');
    end

    _min = 1;
    _max = n;
    while (_max - _min) > 1
        _center = floor((_min + _max) / 2);
        if t >= T(_center)
            _min = _center
        else
            _max = _center
        end
    end

    i = _min;

endfunction
