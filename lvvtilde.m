function ret = lvvtilde(inpic, shape)
	if nargin < 2
        shape = 'same';
	end
       
    dx = zeros(5);
    dy = zeros(5);
    dx(3, 2:4) = [-1/2, 0, 1/2];
    dy(2:4, 3) = [-1/2; 0; 1/2];
    
    lx = filter2(dx, inpic, shape);
    ly = filter2(dy, inpic, shape);
    
    lxx = filter2(dx, lx, shape);
    lxy = filter2(dy, lx, shape);
    lyy = filter2(dy, ly, shape);
    
    ret = lx .^ 2 .* lxx + 2 .* lx .* ly .* lxy + ly .^ 2 .* lyy;
    
end

