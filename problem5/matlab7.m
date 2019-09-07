clear;clc;
path='.\ANS\'
list=dir(strcat(path,'*.bmp'));
for i=1:length(list)
    image{i}=imread(strcat(path,list(i).name));
end
Ans1Route=[4,8,5,13,15,9,11,18,16,1,21];
Image=[];
for i=1:11
    Image=[Image;image{Ans1Route(i)}];
end
imwrite(Image,'ANS1.bmp');
Ans2Route=[12,22,19,20,14,3,6,17,7,10,2];
Image=[];
for i=1:11
    Image=[Image;image{Ans2Route(i)}];
end
imwrite(Image,'ANS2.bmp');