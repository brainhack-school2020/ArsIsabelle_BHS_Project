

function [rights preds logps] = hmm_modeling(trainfold,testfold,params)

   % codebook 
   
   cb = create_codebook(trainfold,params);
   
   % training hmms
   
   parfor i=1:length(trainfold)    
   emis = encode_emissions(trainfold{i},cb);   
   [tms{i} ems{i}] = hmm_training(emis,cb,params); 
   end

   % validate 
   
   rights = [];
   preds = [];
   logps = [];
   
   for i=1:length(testfold)
       
       rights(i,1) = i; 
       emis = encode_emissions(testfold{i},cb);
       
       parfor j=1:length(tms)
       [~,logpstemp(j)] = hmmdecode(emis,tms{j},ems{j});                        
       end
      
       logps(i,:) = logpstemp;  
       [~,idx] = max(logpstemp);                                                                                   
       preds(i,1) = idx; 
           
   end
   
end

