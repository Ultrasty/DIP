% ��-nonlinearity
img = imread('../data1/CT_5.jpg');
gama = 3;
c = 255/(255^gama)*500;
img= uint8(c*(double(img).^gama));% ���Цñ任
imshow(img)
imwrite(img,'../modified images/problem 1d/CT_5.jpg')