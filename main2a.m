for g = 1 :1000
    str=['../data2/CT_',num2str(g),'.jpg'];
    img = imread(str);
    img_modified = uint8(zeros(1024));
    for i = 1:1024
        for j = 1:1024
            % ×î½üÁÚÄÚ²å
            img_modified(i,j)=img(int32((i+1)/4),int32((j+1)/4));
        end
    end
    str=['../modified images/problem 2a/CT_',num2str(g),'.jpg'];
    imwrite(img_modified,str);
end