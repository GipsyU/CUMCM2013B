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
load Head;
load Next;
for i=1:2*n
    if(Head(i)>0)
        Image=image{i};
        x=i;
        tot=1;
        while Next(x)>0
            Image=[Image,image{Next(x)}];
            tot=tot+1;
            x=Next(x);
        end
        if(tot>=1)
            imwrite(Image,strcat('./ANS/head',num2str(i),'.bmp'));
        end
    end
end