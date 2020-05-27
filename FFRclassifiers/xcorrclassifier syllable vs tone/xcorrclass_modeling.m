

function [rights preds xcors] = xcorrclass_modeling(trainfold,testfold,params)
   
   rights = [];
   preds = [];
   xcors = [];
   
   for i=1:length(testfold)
       
       rights(i,1) = i; 
       
       parfor j=1:size(params.stims,1)
       r = xcorr(testfold{i},params.stims(j,:),'coeff');
       rs(j) = max(r);
       end
      
       [~,idx] = max(rs);                                                                                   
       preds(i,1) = idx; 
       xcors(i,:) = rs;
           
   end
   
end

