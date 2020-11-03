img = imread('../data1/CT_4.jpg');
[M,N]=size(img);
% ����Ĵ������������������
operator = zeros(10,10,256);
blocksize=33;% tiles�Ĵ�СΪ33*33
for i = 1:blocksize:330
    for j = 1:blocksize:330
        % ����ÿ��tiles�ı任����
        operator((i+32)/33,(j+32)/33,:) = transform_clip_limited(img(i:i+blocksize-1,j:j+blocksize-1));% ��tiles�ڵı任����
%         for m = i:1:i + blocksize-1
%             for n = j:1:j + blocksize-1
%                 img(m,n)=operator(img(m,n)+1);% ���б任
%             end
%         end
    end
end
for i = 1 :330
    % �Ա任��������˫�����ڲ壬��10*10�Ŵ�330*330���Ŵ�33��������ֹ���ֿ�״ЧӦ
    operator_modified = uint8(zeros(330));
    the33=329/8;% �ӽ�33��һ��ֵ��Ŀ����Ϊ�˲��������±�Խ�磬����ñ߽����
    for x = 1:330
        for y = 1:330
            for z = 1:256
            thex=(x-1)/the33+1;%��1-9
            they=(y-1)/the33+1;
            x1=floor(thex);
            x2=floor(thex+1);
            y1=floor(they);
            y2=floor(they+1);
            % �����Ǽ���P��ĻҶ�ֵ
            fR1=(x2-thex)*operator(x1,y1,z)+(thex-x1)*operator(x2,y1,z);
            fR2=(x2-thex)*operator(x1,y2,z)+(thex-x1)*operator(x2,y2,z);
            fP=(y2-they)*fR1+(they-y1)*fR2;
            fP=uint8(fP);
            operator_modified(x,y,z)=fP;
            end
        end
    end
end
for i=1:330
    for j = 1:330
        img(i,j)=operator_modified(i,j,img(i,j)+1);
    end
end
imshow(img)
imwrite(img,'../modified images/problem 1c/CT_4.jpg')% ������ΪͼƬ
