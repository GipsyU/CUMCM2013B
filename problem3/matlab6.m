clear;clc;
ANS=imread('ANS.bmp');
path='./data/';
list=dir(strcat(path,'*.bmp'));
for i=1:209
    image{i}=imread(strcat(path,list(i).name));
end
Pos=int32(zeros(11,19));
for i=1:11
    for j=1:19
        for k=1:209
            if(isequal(ANS(180*(i-1)+1:180*i,72*(j-1)+1:72*j),image{k}))
                Pos(i,j)=k-1;
                break;
            end
        end
    end
end