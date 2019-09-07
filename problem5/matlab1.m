clear;clc;
path='.\data\';
n=209;
list = dir(strcat(path,'*a.bmp'));
for i = 1:n
    image{i}=imread(strcat(path,list(i).name));
end
list = dir(strcat(path,'*b.bmp'));
for i = 1:n
    image{i+n}=imread(strcat(path,list(i).name));
end
Head=zeros(1,2*n);
for i=1:2*n
    ans=1;
    for j=1:180
        if(image{i}(j,1)<255)ans=0;break;end
    end
    if(ans==1)
        Head(i)=1;
        i
        i-n
    end
end
Head=zeros(1,2*n);
HHH=[10,55,90,100,115,137,144,147,213,215,223,233,245,288,293,298,300,315,375,382,396,409];
for i=1:22
    Head(HHH(i))=1;
end
save('Head.mat','Head');