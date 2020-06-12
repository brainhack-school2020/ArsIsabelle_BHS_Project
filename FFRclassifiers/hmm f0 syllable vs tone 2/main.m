
% Basics

    close all;
    clear all; 

    p = gcp('nocreate');
    if isempty(p)
    parpool(2);                                                               
    end
    
    delete('results/*.mat')

    rng('shuffle');                                                            
    params = setup; 
    
%     totsizes = [50 100 200 500 1000 1500 2000 2300];
    totsizes = 2000;
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
            
            % change input file format
            
            eval(['ffrs = ',sub(1:end-4),'.eeg;']);
            eval(['cls = ',sub(1:end-4),'.sti;']);
            
            ffrs = double(ffrs);
            
            ffrs = resample(ffrs',2000,16384); %  downsample
            ffrs = ffrs';
            
            ons = params.fs*0.050+params.fs*0.005; % stim onset in datapoints
            intval = [ons:ons+params.fs*0.1]; % neural latency of 5 ms
            ffrs = ffrs(:,intval); % remove pre and post stim signal
            
%             idx = find(cls==1); mn = mean(ffrs(idx,:),1); figure; 
%             time = 1000*linspace(0,length(mn)/params.fs,length(mn));
%             plot(time,mn);
            
            % train/test kfolds
            
            clsList = intersect(cls,cls);

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
            plogps = [];

            for j=1:length(testfolds)

                trainfold = trainfolds{j};
                testfold = testfolds{j};
                [right pred logp] = hmm_modeling(trainfold,testfold,params);
                rcls = [rcls;right];
                pcls = [pcls;pred];
                plogps = [plogps;logp];

            end
            
            cm = confusionmat(rcls,pcls);
            cp  = classperf(rcls,pcls);
            sub
            cm = 100*cm/mean(sum(cm,1))

            % save results, clear vars, toc

            outname = [params.rdir,'sub',sub(1:end-4),'_nst',num2str(params.nst),...
            '_size',num2str(params.totsize),...
            '_ave',num2str(params.avesize)];   
            save(outname,'pcls','rcls','plogps');        
            clear trainfolds testfolds

        end
        
        toc
    
    end
    
    
%%

%load('results\subS101_nst3_size2000_ave500.mat');
%cp  = classperf(rcls,pcls)

