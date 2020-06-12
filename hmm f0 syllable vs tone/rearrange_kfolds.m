

function [train,test] = rearrange_kfolds(trainfolds,testfolds)

    for i=1:length(trainfolds{1})
        
       for j=1:length(trainfolds)
       train{i}{j} = trainfolds{j}{i};                                              
       test{i}{j} = testfolds{j}{i};       
       end
    
    end

end