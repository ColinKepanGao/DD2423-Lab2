function [linepar, acc] = houghedgeline(pic, scale, gradmagnthreshold, ...
    nrho, ntheta, nlines, verbose)
    % pic -- grey-level image
    % scale -- scale at which edges are detected
    % gradmagnthreshold -- threshold of gradient magnitude
    
    magnitude = lv(discgaussfft(pic, scale));
    curves = extractedge(pic, scale, gradmagnthreshold);
    [linepar, acc] = houghline(curves, magnitude, nrho, ntheta, ...
        gradmagnthreshold, nlines, verbose);
    subplot(1, 2, 1)
    showgrey(pic)
    title('Origin')
end

