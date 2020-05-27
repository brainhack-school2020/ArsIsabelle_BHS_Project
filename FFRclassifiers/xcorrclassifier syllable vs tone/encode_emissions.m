

function c_em = encode_emissions(c,cb)

    for j=1:size(c,1)                                                       

      m = c(j,:);                                                                                                                    
      c_em(j,:) = vector_quantization(m',cb);                                
                                                                            
    end

end
              
 