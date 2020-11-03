for i = 1 :1000
    % 双线性内插
    str=['../data2/CT_',num2str(i),'.jpg'];
    img = imread(str);
    img_modified = uint8(zeros(1024));
    the4=1023/254;% 接近4的一个值，目的是为了不让数组下标越界，处理好边界情况
    for x = 1:1024
        for y = 1:1024
            thex=(x-1)/the4+1;% thex刚好从1变化到255
            they=(y-1)/the4+1;
            x1=floor(thex);
            x2=floor(thex+1);
            y1=floor(they);
            y2=floor(they+1);
            fR1=(x2-thex)*img(x1,y1)+(thex-x1)*img(x2,y1);
            fR2=(x2-thex)*img(x1,y2)+(thex-x1)*img(x2,y2);
            fP=(y2-they)*fR1+(they-y1)*fR2;
            fP=uint8(fP);
            img_modified(x,y)=fP;
        end
    end
    str=['../modified images/problem 2b/CT_',num2str(i),'.jpg'];
    imwrite(img_modified,str);
end