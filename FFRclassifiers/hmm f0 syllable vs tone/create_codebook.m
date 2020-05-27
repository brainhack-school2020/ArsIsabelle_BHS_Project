

function cb = create_codebook(trainfold,params)

      dtp = [];   
      S = cat(1,trainfold{:});                                                           
      dtp = intersect(S,S);                                                
      cb = lbg(dtp,params.ncw);                                                    

end