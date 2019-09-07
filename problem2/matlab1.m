clear;clc;
list = dir('.\data\*.bmp');
for i = 1:19
    image{i}=imread(strcat('.\data\',list(i).name));
end
G=zeros(19,19);
for i=1:19
    for j =1:19
        if(i==j)continue;end
        for k=1:1980
            G(i,j)=G(i,j)+(double(image{i}(k,72))-double(image{j}(k,1)))^2;
        end
    end
end
save('G.mat','G')