img = imread('../data1/CT_1.jpg');
subplot(2,1,1)
imhist(img)
title('ͼ1 ʹ��imhist')
vecy = myhist(img);
vecx = 0:1:255;
subplot(2,1,2)
plot(vecx,vecy)
title('ͼ2 ʹ���Լ�ͳ�Ƶ���������plot���ɵĽ��')