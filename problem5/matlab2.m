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
G=zeros(2*n,2*n);
for i=1:2*n
    for j=1:2*n
        if(i==j||abs(i-j)==n)G(i,j)=inf;continue;end
        for k=1:180
            G(i,j)=G(i,j)+(double(image{i}(k,72))-double(image{j}(k,1)))^20;
        end
    end
end
load Head;
for i=1:2*n
    if(Head(i)==1)
        for j=1:2*n
            G(j,i)=inf;
        end
    end
end
save('G.mat','G');