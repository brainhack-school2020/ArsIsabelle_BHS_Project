

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
    
  % stim
    [t1 sr] = audioread('../stims/syllPos.wav');
    t1 = t1(:,1);
    t1 = resample(t1,2000,sr);
    t1(1) = [];
    [t2 sr] = audioread('../stims/tonePos.wav');
    t2 = t2(:,2);
    t2 = resample(t2,2000,sr);
    stims = [t1';t2'];

  % structure
    params = struct('cdir',cdir,'ddir',ddir,'rdir',rdir,...
                    'ncw',ncw,'nst',nst,'totsize',totsize,'avesize',avesize,...
                    'fs',fs,'fl',fl,'fo',fo,'fband',fband,'f0range',f0range,...
                    'stims',stims);
                
end
    

    

    