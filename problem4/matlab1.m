clear;clc;
path='.\data\'
n=209
list = dir(strcat(path,'*.bmp'));
for i = 1:n
    image{i}=imread(strcat(path,list(i).name));
end
Judge=int32(zeros(180,n));
for i=1:n
    for j=1:180
        for k=1:72
            if(image{i}(j,k)<255) Judge(j,i)=1; end
        end
    end
end
save('Judge.mat','Judge')