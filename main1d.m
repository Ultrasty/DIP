% ¦Ã-nonlinearity
img = imread('../data1/CT_1.jpg');
gama = 3;
c = 255/(255^gama)*500;
img= uint8(c*(double(img).^gama));
imshow(img)