function Image=solve(path)
    list=dir(strcat(path,'*.bmp'));
    for i=1:length(list)
        image{i}=imread(strcat(path,list(i).name));
    end
    G=zeros(length(list),length(list));
    for i=1:length(list)
        for j=1:length(list)
            if(i==j)continue;end
            for k=1:180
                G(i,j)=G(i,j)+(double(image{i}(k,72))-double(image{j}(k,1)))^2;
            end
        end
    end
    Route=TSP(length(list),G);
    begin=int32(1);
    for i=1:length(list)
        ans=1;
        for j=1:180
            for k=1:10
                if(image{Route(i)}(j,k)<255)ans=0;end
            end
        end
        if(ans==1)begin=i;end
    end
    Image=[];
    for i=1:length(list)
        Image=[Image,image{Route(mod(begin+i-2,length(list))+1)}]
    end
end