img = imread('../data2/CT_1.jpg');
img_modified = uint8(zeros(1024));
for i = 1:256
    for j = 1:256
        for m=1:4
            for n=1:4
                img_modified(4*i-m+1,4*j-n+1)=img(i,j);
            end
        end
    end
end
imshow(img_modified)