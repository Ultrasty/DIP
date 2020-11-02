img = imread('../data2/CT_1.jpg');
img_modified = uint8(zeros(1024));
for i = 1:1024
    for j = 1:1024
        % ×î½üÁÚÄÚ²å
        img_modified(i,j)=img(int32((i+1)/4),int32((j+1)/4));
    end
end
imshow(img_modified)