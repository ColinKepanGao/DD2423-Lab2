% Question 7
godthem = godthem256;
tools = few256;
scale = [1, 5, 10, 20];
threshold = [100, 50, 20, 15];
subplot(2, 2, 1)
overlaycurves(tools, extractedge(tools, scale(1), threshold(1), 'same'))
title(sprintf('scale=%d, threshold=%d', scale(1), threshold(1)))
subplot(2, 2, 2)
overlaycurves(tools, extractedge(tools, scale(2), threshold(2), 'same'))
title(sprintf('scale=%d, threshold=%d', scale(2), threshold(2)))
subplot(2, 2, 3)
overlaycurves(tools, extractedge(tools, scale(3), threshold(3), 'same'))
title(sprintf('scale=%d, threshold=%d', scale(3), threshold(3)))
subplot(2, 2, 4)
overlaycurves(tools, extractedge(tools, scale(4), threshold(4), 'same'))
title(sprintf('scale=%d, threshold=%d', scale(4), threshold(4)))
