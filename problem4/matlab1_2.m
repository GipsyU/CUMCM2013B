%82 133 4
clear;clc;
load Judge
path='.\data\';
n=209;
list = dir(strcat(path,'*.bmp'));
for i = 1:n image{i}=imread(strcat(path,list(i).name));end
Hash=zeros(180,209);
Mode=0;
x=unidrnd(200)+1;
for i=x:x
    Mode=0;
    for j=1:180
        if(j<=Mode)continue;end
        if Judge(j,i)==0
            V=zeros(1,72);
            for k=1:72
                V(k)=Find(image{i}(:,k),j);
            end
            Mode=mode(V);
            Mode
            if(Mode<=180)
                Hash(Mode,i)=255;
            end
        end
    end
end
Image=[]
for i=1:10
    Image=[Image,Hash(:,x)];
end
imshow(Image)
Image=[Image,image{x}];
imshow(Image)