

function params = setup()

  % paths 
    cdir = pwd;
    ddir = '../input1/';                                               
    rdir = 'results/';                                                     
    
  % hmm
    nst = 3;                                                                
    ncw = 50; 
    
  % ffrs
    totsize = 100;                                                                                                               
    avesize = 25;                                                           
    
  % signal processing
    fs = 2000;                                                             
    fl = 0.04;                                                             
    fo = 0.03;                                                              
    fband = [80 1000];  
    f0range = [80 200];

  % structure
    params = struct('cdir',cdir,'ddir',ddir,'rdir',rdir,...
                    'ncw',ncw,'nst',nst,'totsize',totsize,'avesize',avesize,...
                    'fs',fs,'fl',fl,'fo',fo,'fband',fband,'f0range',f0range);
                
end
    

    

    