
function [f0 time] = f0track(s,params)
    
    % general
      fl = round(params.fs*params.fl);                                     
      fo = round(params.fs*params.fo);                                      
      ft = fl-fo;                                                           
      if size(s,1)==1
      s=s';
      end
 
    % init loop
      ini = 1;
      fin = fl-1;
      cnt = 1;
      time = [];
      f0=zeros(1,1);
  
      while fin <= length(s)
                  
         % frame
           frame = s(ini:fin);
           win = hann(length(frame));
           frame = detrend(frame.*win,'constant');
      
         % time
           time(cnt) = mean([ini,fin])/params.fs;
         
         % autocorrelation  
           [c lag] = xcorr(frame,'coeff');
           [c_win lag_win] = xcorr(win,'coeff');            
            c = c./c_win; 
       
         % remove second half of the autocrrelation function
           c(fl:end) = [];                                         
           lag(fl:end) = [];
         
         % search interval from 75 to 200 Hz
           idx_minf = find(abs(params.fs./lag)<=params.f0range(1),1,'last');         
           idx_maxf = find(abs(params.fs./lag)>=params.f0range(2),1,'first');
        
         % select lags and cs within the intrval
           interval = [idx_minf:idx_maxf];    
           c = c(interval(:));
           lag = lag(interval(:));
           
         % select max c within the interval
           [~,idx] = max(c);
           f0(1,cnt) = abs(params.fs./lag(idx));
         
         % update vars
           cnt = cnt+1;
           ini = ini+ft-1;
           fin = ini+fl-1;
                          
       end
        
end