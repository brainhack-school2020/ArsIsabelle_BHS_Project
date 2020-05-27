
% Basics

    close all;
    clear all; 

    p = gcp('nocreate');
    if isempty(p)
    parpool(3);                                                               
    end

    rng('shuffle');                                                            
    params = setup; 
    
    totsizes = [50 100 200 500 1000 1500 2000 2300];
    avesizes = round(totsizes/4);
    
% Main

    for k=1:length(totsizes)
        
        tic
        
        params.totsize = totsizes(k);
        params.avesize = avesizes(k);
      
        subList = dir([params.ddir,'*.mat']);                                

        for i=1:length(subList)  

            % load subject ffrs

            sub = subList(i).name;
            load([params.ddir,sub]); 
            clsList = intersect(cls,cls);

            % train/test kfolds

            input = struct('ffrs',ffrs,'cls',cls);
            parfor j=1:length(clsList) 
            clsid = clsList(j);
            [trainfolds{j},testfolds{j}] = create_kfolds(input,clsid,params);
            end

            % move-average train folds

            parfor j=1:length(clsList)        
            trainfolds{j} = moving_average(trainfolds{j},params);           
            end

            % f0s

             for j=1:length(clsList)                                              
             trainfolds{j} = ffr2f0(trainfolds{j},params);                               
             testfolds{j} = ffr2f0(testfolds{j},params);                               
             end

            % rearrange kfolds

            [trainfolds,testfolds] = rearrange_kfolds(trainfolds,testfolds);

            % cross-validation

            pcls = [];
            rcls = [];

            for j=1:length(testfolds)

                trainfold = trainfolds{j};
                testfold = testfolds{j};
                [right pred logp] = hmm_modeling(trainfold,testfold,params);
                
                traincls = [];
                testcls = [];
                train = [];
                test = [];
                
                for h=1:length(trainfold)
                    traincls = [traincls;h*ones(size(trainfold{h},1),1)];
                    train = [train;trainfold{h}];
                    testcls = [testcls;h];
                    test = [test;testfold{h}];
                end
                
                mdl = fitcecoc(train,traincls); 
                pcls = [pcls;predict(mdl,test)];
                rcls = [rcls;testcls];

            end
            
            cm = confusionmat(rcls,pcls);
            sub
            cm = 100*cm/mean(sum(cm,1))

            % save results, clear vars, toc

            outname = [params.rdir,'sub',sub(1:end-4),'_nst',num2str(params.nst),...
            '_size',num2str(params.totsize),...
            '_ave',num2str(params.avesize)];   
            save(outname,'pcls','rcls');        
            clear trainfolds testfolds

        end
        
        toc
    
    end

