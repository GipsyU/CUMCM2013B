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
load G;
load Next;
for i=1:2*n
    if(Next(i)>0)
        for j=1:2*n
            G(j,Next(i))=inf;
        end
    end
end
for i=1:2*n
    if(Next(i)>0||Next(i)<0)continue;end
    tmp=G(i,:);
    [Y,I]=sort(tmp);
    Image=[];
    Imagetmp=[];
    for j=1:3
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    Imagetmp=[];
    for j=4:6
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    Imagetmp=[];
    for j=7:9
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    Imagetmp=[];
    for j=10:12
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    Imagetmp=[];
    for j=13:15
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    Imagetmp=[];
    for j=16:18
        Imagetmp=[Imagetmp,image{i},image{I(j)},zeros(180,10)];
    end
    Image=[Imagetmp;zeros(10,72*6+30);Image];
    imshow(Image);
    Ans=int32(input(''));
    if(Ans==0)
        continue; 
    end
    if(Ans==-1)
        Next(i)=-1;
        continue;
    end
    Next(i)=I(Ans);
end
save('Next.mat','Next');