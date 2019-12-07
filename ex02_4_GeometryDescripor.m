% Question 4
% godthem = godthem256;
% scale = [0.01, 1, 5];
% scale = [10, 20, 50];
% subplot(1, 3, 1)
% contour(lvvtilde(discgaussfft(godthem, scale(1)), 'same'), [0, 0]);
% axis('image')
% axis('ij')
% title(sprintf('scale = %.2f', scale(1)))
% subplot(1, 3, 2)
% contour(lvvtilde(discgaussfft(godthem, scale(2)), 'same'), [0, 0]);
% axis('image')
% axis('ij')
% title(sprintf('scale = %d', scale(2)))
% subplot(1, 3, 3)
% contour(lvvtilde(discgaussfft(godthem, scale(3)), 'same'), [0, 0]);
% axis('image')
% axis('ij')
% title(sprintf('scale = %d', scale(3)))

% % Question 5
% tools = few256;
% scale = [0.01, 1, 5];
% % scale = [10, 20, 50];
% subplot(1, 3, 1)
% showgrey(lvvvtilde(discgaussfft(tools, scale(1)), 'same') < 0);
% axis('image')
% axis('ij')
% title(sprintf('scale = %.2f', scale(1)))
% subplot(1, 3, 2)
% showgrey(lvvvtilde(discgaussfft(tools, scale(2)), 'same') < 0);
% axis('image')
% axis('ij')
% title(sprintf('scale = %d', scale(2)))
% subplot(1, 3, 3)
% showgrey(lvvvtilde(discgaussfft(tools, scale(3)), 'same') < 0);
% axis('image')
% axis('ij')
% title(sprintf('scale = %d', scale(3)))

% Question 6
tools = few256;
scale = 50;
M = contour(lvvtilde(discgaussfft(tools, scale), 'same'), [0, 0]);
[row, col] = size(M);
c = zeros(256);
for i = 1: col
    if M(1,i) == 0
        continue
    else
        c(int32(M(1, i)), int32(M(2, i))) = 1;
    end
end
l = lvvvtilde(discgaussfft(tools, scale), 'same') < 0;
subplot(1, 3, 1)
showgrey(c')
title(sprintf('lvv = 0, scale = %d', scale))
subplot(1, 3, 2)
showgrey(l)
title(sprintf('lvvv < 0, scale = %d', scale))
subplot(1, 3, 3)
showgrey(and(c', l))
title(sprintf('combined, scale = %d', scale))
