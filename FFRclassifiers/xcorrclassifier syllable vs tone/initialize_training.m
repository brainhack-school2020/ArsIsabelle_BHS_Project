

function [tm_ini, em_ini] = initialize_training(nst,emis,ncw)
      
    % transition matrix
      for i=1:nst
        
        for j=1:nst
            
           if (j<i) | (j>i+2)
           tm_ini(i,j) = 0;
           else
           tm_ini(i,j) = 1/min(3,(nst-i+1));
           end
           
        end
        
      end
    
    % emission matrix
      frame = floor(linspace(1,size(emis,2),nst+1));
      frame(1) = 0;

      for j=1:nst
        
         for i=1:ncw
         block = emis(:,frame(j)+1:frame(j+1));
         em_ini(j,i) = length(find(block==i))/prod(size(block));
         end
       
      end
         
end