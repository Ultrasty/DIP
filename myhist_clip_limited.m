function line = myhist_clip_limited(img)
% 计算每个灰度值出现的次数
% 这个函数设置了clip limit，并且没有将修剪掉的那部分直方图直接扔掉，而是采用了更妥当的办法，
% 就是将这些被修剪掉的部分重新均匀的分布到直方图中，从而生成新的直方图
bd = 256; % 位深度默认为8
line = zeros(1,bd);
[M,N]=size(img);
limit = 100; 
remain=0;
for m = 1:M
    for n = 1:N
        if(line(img(m,n)+1)<limit)
            line(img(m,n)+1)=line(img(m,n)+1)+1;
        else
            remain=remain+1;
        end
    end
end
for i = 1:256
    line(i)=line(i)+remain/256;
end