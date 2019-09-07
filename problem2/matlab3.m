clear;clc;
list = dir('.\data\*.bmp');
for i = 1:19
    image{i}=imread(strcat('.\data\',list(i).name));
end
load ans;
Image=[];
for i =1:19
    Image=[Image,image{best_route(i)}];
end
imshow(Image)
imwrite(Image,'ans2.bmp')