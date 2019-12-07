function ret = lvvvtilde(inpic, shape)
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
    lyy = filter2(dy, ly, shape);
    
    lxxx = filter2(dx, lxx, shape);
    lxxy = filter2(dy, lxx, shape);
    lyyx = filter2(dx, lyy, shape);
    lyyy = filter2(dy, lyy, shape);
    
    ret = lx .^ 3 .* lxxx + 3 .* lx .^ 2 .* ly .* lxxy + ...
        3 .* lx .* ly .^ 2 .* lyyx + ly .^ 3 .* lyyy;
    
end