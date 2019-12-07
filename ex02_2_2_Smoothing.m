godthem = godthem256;

% subplot(1, 3, 1)
% showgrey(godthem)
% title('original')
% subplot(1, 3, 2)
% showgrey(discgaussfft(godthem, 1))
% title('discgaussfft(godthem, 1)')
% subplot(1, 3, 3)
% showgrey(discgaussfft(godthem, 3))
% title('discgaussfft(godthem, 3)')

% subplot(1, 3, 1)
% histogram(lv(godthem))
% title('histogram(lv(godthem))')
% subplot(1, 3, 2)
% histogram(lv(discgaussfft(godthem, 1)))
% title('histogram(lv(discgaussfft(godthem, 1)))')
% subplot(1, 3, 3)
% histogram(lv(discgaussfft(godthem, 3)))
% title('histogram(lv(discgaussfft(godthem, 3)))')

threshold = 30000;
subplot(1, 3, 1)
showgrey( (lv(godthem) - threshold) > 0 )
title(sprintf('lv(godthem), threshold = %d', threshold))
subplot(1, 3, 2)
showgrey( (lv(discgaussfft(godthem, 1)) - threshold) > 0 )
title(sprintf('smoothed with sigma=1, threshold = %d', threshold))
subplot(1, 3, 3)
showgrey( (lv(discgaussfft(godthem, 3)) - threshold) > 0 )
title(sprintf('smoothed with sigma=3, threshold = %d', threshold))


