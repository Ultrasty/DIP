% 双三次插值
for k = 1:1000
    str=['../data2/CT_',num2str(k),'.jpg'];
    img = imread(str);
    img_modified=zeros(1024);
    for x = 1:1024
        for y = 1:1024
            x1=floor(x/4)-1;
            y1=floor(y/4)-1;
            % 下面是为了不让下标越界
            if(x1<1)
                x1=1;
            elseif(x1>253)
                x1=253;
            end
            if(y1<1)
                y1=1;
            elseif(y1>253)
                y1=253;
            end
            for i = x1:x1+3
                for j = y1:y1+3
                    % 先转换为double再计算，以免误差放大
                    img_modified(x,y)=img_modified(x,y)+double(img(i,j))*bicubic(double(i)-x/4)*bicubic(double(j)-y/4);
                end
            end

        end
    end
    img_modified=uint8(img_modified);
%     imshow(img_modified)
    str=['../modified images/problem 2c/CT_',num2str(k),'.jpg'];
    imwrite(img_modified,str);
end