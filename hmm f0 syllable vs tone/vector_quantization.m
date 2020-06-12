

function v_em = vector_quantization(v,cb)
      
     for k=1:size(v,1)                                                           
     p = v(k,:);                                                           
     d = pdist2(p,cb);                                                     
     [~,idx] = min(d);
     v_em(1,k) = idx;                                                       
     end

end

