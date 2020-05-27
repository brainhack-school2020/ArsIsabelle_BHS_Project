  

function c_f0 = ffr2f0(c,params)

      for j=1:length(c)                                                     

        m = c{j};                                                           
        
        parfor i=1:size(m,1)                                               
        v = m(i,:);                                                         
        f0 = f0track(v,params);                                             
        m_f0(i,:) = f0;                                                    
        end

        c_f0{j} = m_f0;                                                    

      end
         
end

