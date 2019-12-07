function edge = extractedge(inpic, scale, threshold, shape)
    if nargin <= 2
        shape = 'same';
        threshold = 0;
    elseif nargin <= 3
        shape = 'same';
    end
    
    lv_ = lv(discgaussfft(inpic, scale), shape);
    lvv = lvvtilde(discgaussfft(inpic, scale), shape);
    lvvv = lvvvtilde(discgaussfft(inpic, scale), shape);
    
    lv_mask = (lv_ > threshold) .* 2 - 1;
    lvvv_mask = (lvvv < 0) .* 2 -1;
    
    edge = zerocrosscurves(lvv, lvvv_mask);
    edge = thresholdcurves(edge, lv_mask);
    
end

