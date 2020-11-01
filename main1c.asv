img = imread('../data1/CT_1.jpg');
[M,N]=size(img);

blocksize=33;
for i = 1:blocksize:330-2*blocksize
    for j = 1:blocksize:330-2*blocksize
        operator = transform_clip_limited(img(i:i+3*blocksize-1,j:j+3*blocksize-1));
        for m = i:1:i + 3*blocksize-1
            for n = j:1:j + 3*blocksize-1
                img(m,n)=operator(img(m,n)+1);
            end
        end
    end
end
imshow(img)