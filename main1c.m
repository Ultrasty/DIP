img = imread('../data1/CT_4.jpg');
[M,N]=size(img);
% 下面的代码跑下来大概两分钟
operator = zeros(10,10,256);
blocksize=33;% tiles的大小为33*33
for i = 1:blocksize:330
    for j = 1:blocksize:330
        % 计算每个tiles的变换函数
        operator((i+32)/33,(j+32)/33,:) = transform_clip_limited(img(i:i+blocksize-1,j:j+blocksize-1));% 该tiles内的变换函数
%         for m = i:1:i + blocksize-1
%             for n = j:1:j + blocksize-1
%                 img(m,n)=operator(img(m,n)+1);% 进行变换
%             end
%         end
    end
end
for i = 1 :330
    % 对变换函数进行双线性内插，将10*10放大到330*330（放大33倍），防止出现块状效应
    operator_modified = uint8(zeros(330));
    the33=329/8;% 接近33的一个值，目的是为了不让数组下标越界，处理好边界情况
    for x = 1:330
        for y = 1:330
            for z = 1:256
            thex=(x-1)/the33+1;%从1-9
            they=(y-1)/the33+1;
            x1=floor(thex);
            x2=floor(thex+1);
            y1=floor(they);
            y2=floor(they+1);
            % 下面是计算P点的灰度值
            fR1=(x2-thex)*operator(x1,y1,z)+(thex-x1)*operator(x2,y1,z);
            fR2=(x2-thex)*operator(x1,y2,z)+(thex-x1)*operator(x2,y2,z);
            fP=(y2-they)*fR1+(they-y1)*fR2;
            fP=uint8(fP);
            operator_modified(x,y,z)=fP;
            end
        end
    end
end
for i=1:330
    for j = 1:330
        img(i,j)=operator_modified(i,j,img(i,j)+1);
    end
end
imshow(img)
imwrite(img,'../modified images/problem 1c/CT_4.jpg')% 保存结果为图片
