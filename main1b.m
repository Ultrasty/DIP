img = imread('../data1/CT_1.jpg');
%% ���Լ�д��transform����ȫ��ֱ��ͼ����
operator = transform(img);
[M,N]=size(img);
for m = 1:M
    for n = 1:N
        img(m,n)=operator(img(m,n)+1);
    end
end
% subplot(2,1,1)
% imshow(img)
% title('ͼ1 ȫ��ֱ��ͼ������ͼ��')
% subplot(2,1,2)
imhist(img)
title('ͼ1 ȫ��ֱ��ͼ������ֱ��ͼ')
imwrite(img,'../modified images/problem 1b/CT_1.jpg')