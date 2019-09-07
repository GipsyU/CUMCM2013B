clear;clc;
solved=[0,0,1,1,1,0,1,1,1,1,1,1];
for i =1:2
    if(solved(i)==1)continue;end
    path=strcat('.\Class',num2str(i),'\');
    list=dir(strcat(path,'*.bmp'));
    if(length(list)==19)
        Image=solve(path);
%         imshow(Image);
        imwrite(Image,strcat('.\ANS\',num2str(i),'.bmp'));
    end
end