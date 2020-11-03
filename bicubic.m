function wx = bicubic(x)
%¹¹ÔìBICUBICº¯Êý
a = -0.5;
x=abs(x);
if(x<=1)
    wx=(a+2)*x^3-(a+3)*x^2+1;
elseif(x>1 && x<2)
    wx=a*x^3-5*a*x^2+8*a*x-4*a;
else
    wx=0;
end