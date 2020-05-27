

function [trainfolds,testfolds]=create_kfolds(input,clsid,params)
           
    cls = input.cls;
    ffrs = input.ffrs;

    idx = find(cls==clsid);
    idx = idx(1:params.totsize);
        
    d = floor(params.totsize/params.avesize);
    ons = 1;
    ofs = params.avesize;
    
    for i=1:d
      
        testfolds{i} = mean(ffrs(idx(ons:ofs),:)); 
        temp = setdiff(idx,idx(ons:ofs));
        trainfolds{i} = ffrs(temp,:);
        ons = ofs + 1;
        ofs = ofs + params.avesize;
        
    end
                                               
end
