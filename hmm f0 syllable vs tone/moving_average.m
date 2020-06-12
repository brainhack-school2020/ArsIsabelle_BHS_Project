

function c_ave = moving_average(c,params)

    n = params.avesize;
        
    sc = floor(n/2);                                                         
    if mod(n,2)==0
    sus = 1;                                    
    else
    sus = 0;
    end
        
    for i=1:length(c)                                                       

         f = c{i};                                                          

         for j=1:size(f,1)                                               
         idx = mod([j-sc:j+sc-sus],size(f,1))+1;                           
         f_ave(j,:) = mean(f(idx,:),1);                                     
         end
         
         c_ave{i} = f_ave;                                                 
            
    end
        
end
        