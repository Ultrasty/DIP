img = imread('../data1/CT_5.jpg');
[M,N]=size(img);

blocksize=33;% tiles的大小为33*33
for i = 1:blocksize:330
    for j = 1:blocksize:330
        operator = transform_clip_limited(img(i:i+blocksize-1,j:j+blocksize-1));% 该tiles内的变换函数
        for m = i:1:i + blocksize-1
            for n = j:1:j + blocksize-1
                img(m,n)=operator(img(m,n)+1);% 进行变换
            end
        end
    end
end
% subplot(2,1,1)
% imshow(img)
% subplot(2,1,2)
imhist(img)
imwrite(img,'../modified images/problem 1c/CT_5.jpg')% 保存结果为图片