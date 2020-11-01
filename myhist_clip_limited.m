function line = myhist_clip_limited(img)
% ����ÿ���Ҷ�ֵ���ֵĴ���
% �������������clip limit������û�н��޼������ǲ���ֱ��ͼֱ���ӵ������ǲ����˸��׵��İ취��
% ���ǽ���Щ���޼����Ĳ������¾��ȵķֲ���ֱ��ͼ�У��Ӷ������µ�ֱ��ͼ
bd = 256; % λ���Ĭ��Ϊ8
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