function line = myhist(img)
% 计算每个灰度值出现的次数
bd = 256; % 位深度默认为8
line = zeros(1,bd);
[M,N]=size(img);
for m = 1:M
    for n = 1:N
        line(img(m,n)+1)=line(img(m,n)+1)+1;
    end
end
