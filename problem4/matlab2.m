clear;clc;
load Hash
while true
    Class=kmeans(Hash',13);
    num=zeros(13,1);
    for i=1:209
        num(Class(i))=num(Class(i))+1;
    end
    if(max(num)<20)
        bar(1:13,num)
        break;
    end
end
save('Class.mat','Class')
% Class=kmeans(Hash',12);
% num=zeros(12,1);
% for i=1:209
%     num(Class(i))=num(Class(i))+1;
% end
% bar(1:12,num)