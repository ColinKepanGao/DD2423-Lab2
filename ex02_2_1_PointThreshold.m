tools = few256;
deltax = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
deltay = [1, 2, 1; 0, 0, 0; -1, -2, -1];
toolsdx = conv2(tools, deltax, 'valid');
toolsdy = conv2(tools, deltay, 'valid');

subplot(1, 3, 1)
showgrey(tools)
title('Original')

gradmagntools = sqrt(toolsdx .^2 + toolsdy .^2);

subplot(1, 3, 2)
showgrey(gradmagntools)
title('gradmagntools')

subplot(1, 3, 3)
histogram(gradmagntools)
title('histogram(gradmagntools)')

% threshold = 100;
% subplot(1, 3, 1)
% showgrey((gradmagntools - threshold) > 0)
% title(sprintf('Threshold = %d', threshold))
% 
% threshold = 150;
% subplot(1, 3, 2)
% showgrey((gradmagntools - threshold) > 0)
% title(sprintf('Threshold = %d', threshold))
% 
% threshold = 200;
% subplot(1, 3, 3)
% showgrey((gradmagntools - threshold) > 0)
% title(sprintf('Threshold = %d', threshold))


