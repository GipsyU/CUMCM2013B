clear;clc;
path=strcat('.\Class10\');
list=dir(strcat(path,'*.bmp'));
for i=1:length(list)
    image{i}=imread(strcat(path,list(i).name));
end
ANS=[18,9,3,14,17,16,1,10,15,6,11,2,13,4,19,7,5,8,12]
Image=[];
for i=1:19
    Image=[Image,image{ANS(i)}];
end
imshow(Image);
imwrite(Image,strcat('.\ANS\',num2str(10),'.bmp'))