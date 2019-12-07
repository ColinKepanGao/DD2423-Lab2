tools = few256;
% span for 180
deltax = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
deltay = [1, 2, 1; 0, 0, 0; -1, -2, -1];

toolsdx = conv2(tools, deltax, 'valid');
toolsdy = conv2(tools, deltay, 'valid');

subplot(1, 3, 1)
showgrey(tools)
title('Original size=256')
% title(sprintf('Original size=%d', size(tools)))

subplot(1, 3, 2)
showgrey(toolsdx)
title('deltax size=254')
% title(sprintf('deltax, size=%d', size(toolsdx)))

subplot(1, 3, 3)
showgrey(toolsdy)
title('deltay size=254')
% title(sprintf('deltay, size=%d', size(toolsdy)))
