clear;clc;
for i=1:13 
    mkdir(strcat('Class',num2str(i)));
end
list = dir('.\data\*.bmp');
for i = 1:209
    image{i}=imread(strcat('.\data\',list(i).name));
end
load Class;
for i=1:209
    imwrite(image{i},strcat('.\Class',num2str(Class(i)),'\',list(i).name))
end
