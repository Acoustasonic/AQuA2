function out = normalize01(dat)
%NORMALIZE01 Scale numeric data to [0, 1] without depending on rescale().
    out = double(dat);
    valid = isfinite(out);

    if ~any(valid(:))
        out(:) = 0;
        return;
    end

    minVal = min(out(valid));
    maxVal = max(out(valid));
    rangeVal = maxVal - minVal;

    if rangeVal > 0
        out = (out - minVal) ./ rangeVal;
    else
        out(:) = 0;
    end

    out(~valid) = 0;
end
