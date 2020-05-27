

function [TM EM] = hmm_training(train,cb,params)
               
       emis = train;                                                        % get matrix of emission sequences
       [tm_ini,em_ini] = initialize_training(params.nst,emis,size(cb,1));   % initial guess for transition and emission matrices
       [TM EM] = hmmtrain(emis,tm_ini,em_ini,...                            % train with Viterbi                 
                          'algorithm','Viterbi',...
                          'Pseudoemissions',0.001*ones(size(em_ini)),...
                          'Pseudotransitions',0.001*ones(size(tm_ini)));
          
end

