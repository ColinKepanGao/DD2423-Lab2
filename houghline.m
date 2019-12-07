function [linepar, acc] = houghline(curves, magnitude, ...
    nrho, ntheta, threshold, nlines, verbose)
    % curves -- polygons from which the transform is to be computed
    % magnitude -- an image with intensity value
    % nrho -- number of accumulators in the rho direction
    % ntheta -- number of accumulators in the theta direction
    % threshold -- lowest allowed value of magnitude
    % nlines -- number of lines to be exrtacted
    % verbose -- degree of extra information and figures
    % linepar -- list of (rho, theta)
    
    % Accumulator space
    acc = zeros(nrho, ntheta);
    % Coordinate system
    theta = linspace(- pi/2, pi/2, ntheta);
    D = sqrt(size(magnitude, 1) ^ 2 + size(magnitude, 2) ^ 2);
    rho = linspace(-D, D, nrho);
    % Loop all the input curves
    pointer = 1;
    while pointer <= size(curves, 2)
        levelNum = curves(2, pointer);
        pointer = pointer + 1;
        for polyIndex = 1 : levelNum
            x = curves(2, pointer);
            y = curves(1, pointer);
            if magnitude(round(x), round(y)) > threshold
                for thetaIndex = 1 : ntheta
                    rho_temp = x * cos(theta(thetaIndex)) + ...
                        y * sin(theta(thetaIndex));
                    [~, rhoIndex] = min(abs(rho - rho_temp));
%                     acc(rhoIndex, thetaIndex) = acc(rhoIndex, thetaIndex) + 1;
                    acc(rhoIndex, thetaIndex) = acc(rhoIndex, thetaIndex) + ...
                        exp(magnitude(round(x), round(y)));
                end
            end
            pointer = pointer + 1;
        end
    end
    
    [pos, value] = locmax8(acc);
    [~, indexvector] = sort(value, 'descend');
    
    linepar = zeros(2, nlines);
    for idx = 1 : nlines
        rhoidxacc = pos(indexvector(idx), 1);
        thetaidxacc = pos(indexvector(idx), 2);
        linepar(:, idx) = [rho(rhoidxacc); theta(thetaidxacc)];
    end
    
    outcurves = zeros(2, 4 * nlines);
    for idx = 1 : nlines
        rho_temp = linepar(1, idx);
        theta_temp = linepar(2, idx);
        x0 = rho_temp * cos(theta_temp);
        y0 = rho_temp * sin(theta_temp);
        dx = D ^ 2 * ( - sin(theta_temp));
        dy = D ^ 2 * cos(theta_temp);
        outcurves(1, 4 * (idx - 1) + 1) = 0;    % level, not significant
        outcurves(2, 4 * (idx - 1) + 1) = 3;    % number of points in the curve
        outcurves(2, 4 * (idx - 1) + 2) = x0 - dx;
        outcurves(1, 4 * (idx - 1) + 2) = y0 - dy;
        outcurves(2, 4 * (idx - 1) + 3) = x0;
        outcurves(1, 4 * (idx - 1) + 3) = y0;
        outcurves(2, 4 * (idx - 1) + 4) = x0 + dx;
        outcurves(1, 4 * (idx - 1) + 4) = y0 + dy;
    end
    if (verbose == 1)
        subplot(1,2,2)
        overlaycurves(magnitude, outcurves);
        axis([1 size(magnitude, 2) 1 size(magnitude, 1)]);
        title(sprintf('Overlay Curves\n nrho=%d,ntheta=%d,threshold=%d,nline=%d', nrho, ntheta, threshold, nlines))
%         subplot(1,3,2)
%         showgrey(acc);
%         title('Hough Transform (acc)')
    end
end

