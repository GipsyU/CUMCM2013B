clear;clc;
path='.\ANS\'
list=dir(strcat(path,'*.bmp'));
for i=1:length(list)
    image{i}=imread(strcat(path,list(i).name));
end
G=zeros(length(list),length(list));
for i=1:length(list)
    for j=1:length(list)
        if(i==j)continue;end
        for k=1:1368
            G(i,j)=G(i,j)+(double(image{i}(180,k))-double(image{j}(1,k)))^2;
        end
    end
end
Route=TSP(length(list),G);
Image=[];
for i=1:length(list)
    Image=[Image;image{Route(i)}];
end
imshow(Image);