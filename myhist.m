function line = myhist(img)
% ����ÿ���Ҷ�ֵ���ֵĴ���
bd = 256; % λ���Ĭ��Ϊ8
line = zeros(1,bd);
[M,N]=size(img);
for m = 1:M
    for n = 1:N
        line(img(m,n)+1)=line(img(m,n)+1)+1;
    end
end
