testimage1 = triangle128;
smalltest1 = binsubsample(testimage1);

testimage2 = houghtest256;
smalltest2 = binsubsample(binsubsample(testimage2));

tools = few256;
phone = phonecalc256;
house = godthem256;

pic = house;
scale = 0;
nrho = 200;
ntheta = 20;
gradmagnthreshold = 300;
nlines = 10;
verbose = 1;
tic;
[linepar, acc] = houghedgeline(pic, scale, gradmagnthreshold, nrho, ...
                               ntheta, nlines, verbose);
toc;
