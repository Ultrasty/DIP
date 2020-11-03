% Ë«Èý´Î²åÖµ
str=['../data2/CT_','1','.jpg'];
img = imread(str);
img_modified=uint8(zeros(1024));
for x = 1:1024
    for y = 1:1024
        x1=uint8(x/4)-1;
        y1=uint8(y/4)-1;
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
                img_modified(x,y)=img_modified(x,y)+img(i,j)*bicubic(double(i)-x/4)*bicubic(double(j)-y/4);
            end
        end
        
    end
end
imshow(img_modified)