img = imread('../data1/CT_1.jpg');
subplot(2,1,1)
imhist(img)
title('图1 使用imhist')
vecy = myhist(img);
vecx = 0:1:255;
subplot(2,1,2)
plot(vecx,vecy)
title('图2 使用自己统计的数据利用plot生成的结果')