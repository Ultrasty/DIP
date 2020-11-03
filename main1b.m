img = imread('../data1/CT_1.jpg');
%% 用自己写的transform进行全局直方图均衡
operator = transform(img);
[M,N]=size(img);
for m = 1:M
    for n = 1:N
        img(m,n)=operator(img(m,n)+1);
    end
end
% subplot(2,1,1)
% imshow(img)
% title('图1 全局直方图均衡后的图像')
% subplot(2,1,2)
imhist(img)
title('图1 全局直方图均衡后的直方图')
imwrite(img,'../modified images/problem 1b/CT_1.jpg')