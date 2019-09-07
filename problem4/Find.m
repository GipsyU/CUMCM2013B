function ans=Find(A,x)
    for i=x:180
        if A(i)<255;
            ans=i;
            return;
        end
    end
    ans=unidrnd(10000)+200;
end