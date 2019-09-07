clc,clear            %????????
tic
iter = 1;                                                                                  % ??????
a=0.99;                                                                                    %??????
t0=120;                                                                                    %????
tf=1;                                                                                      %????
t=t0;
Markov=10000;                                                                              %Markov???
n = 19;
load G;
D = G;                                                                                                                                  
route=1:n;   
route_new=route;
best_length=Inf;
Length=Inf;
best_route=route;

while t>=tf
            for j=1:Markov
                    %????,??????route_new;
                    if (rand<0.7)
                        %????????
                           ind1=0;ind2=0;
                           while(ind1==ind2&&ind1>=ind2)
                                    ind1=ceil(rand*n);
                                    ind2=ceil(rand*n);
                           end                      
                                      temp=route_new(ind1);
                                      route_new(ind1)=route_new(ind2);
                                      route_new(ind2)=temp;
                    else
                          ind=zeros(3,1);
                          L_ind=length(unique(ind));
                          while (L_ind<3)
                                    ind=ceil([rand*n rand*n rand*n]);
                                    L_ind=length(unique(ind));
                          end
                          ind0=sort(ind);
                          a1=ind0(1);b1=ind0(2);c1=ind0(3);
                         route0=route_new;
                         route0(a1:a1+c1-b1-1)=route_new(b1+1:c1);
                         route0(a1+c1-b1:c1)=route_new(a1:b1);
                         route_new=route0;    
                    end 
                     %???????,Length_new 
                          length_new = 0;
                          Route=[route_new route_new(1)];
                              for j = 1:n
                                  length_new = length_new+ D(Route(j),Route(j + 1));
                              end
                     if length_new<Length      
                              Length=length_new;
                              route=route_new;
                           %??????????
                           if       length_new<best_length
                                    iter = iter + 1;    
                                     best_length=length_new;
                                     best_route=route_new;
                           end
                     else
                             if rand<exp(-(length_new-Length)/t)
                                  route=route_new;
                                  Length=length_new;
                              end
                     end
                       route_new=route; 
                end              
                        t=t*a;
end

%% ???? 
toc
Route=[best_route best_route(1)];
    disp('?????')
    disp(best_route)
    disp('?????')
    disp(best_length)
    disp('????????')
    disp(iter)