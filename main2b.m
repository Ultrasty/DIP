for i = 1 :1000
    % ˫�����ڲ�
    str=['../data2/CT_',num2str(i),'.jpg'];
    img = imread(str);
    img_modified = uint8(zeros(1024));
    the4=1023/254;% �ӽ�4��һ��ֵ��Ŀ����Ϊ�˲��������±�Խ�磬����ñ߽����
    for x = 1:1024
        for y = 1:1024
            thex=(x-1)/the4+1;% thex�պô�1�仯��255
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