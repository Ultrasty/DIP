function outputArg1 = transform(img)
% ���������ڼ���(L-1)/MN ��nj ����CDN����任����
    outputArg1 = myhist(img);
    [M,N]=size(img);
    for i = 2:256
        outputArg1(i)= outputArg1(i-1)+outputArg1(i);
    end
    for i = 1:256
        outputArg1(i)=uint8(outputArg1(i)*255/(M*N));
    end
end

