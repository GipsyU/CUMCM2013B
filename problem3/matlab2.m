clear;clc;
load Hash
while true
    Class=kmeans(Hash',12);
    num=zeros(12,1);
    for i=1:209
        num(Class(i))=num(Class(i))+1;
    end
    if(max(num)<20)
        bar(1:12,num)
        break;
    end
end

