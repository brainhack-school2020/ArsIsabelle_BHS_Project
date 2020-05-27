

close all
clear all

fs = 16384;
prestilen = 0.05*fs;
nlaglen = 0.01*fs;
ffrons = round(prestilen + nlaglen);
ffrofs = ffrons + round(0.1*fs) - 1;

pathout = 'input1/';
pathin = 'ffrs/';
subs = dir([pathin,'*.mat']);

for i=1:length(subs)
    
    sub = subs(i).name;
    load([pathin,sub]);
    
    eval(['subTemp = ',sub(1:end-4),';']);
    
    ffrsTemp = subTemp.eeg(:,[ffrons:ffrofs]);
    ffrsTemp = double(ffrsTemp);
    ffrsTemp = resample(ffrsTemp',2000,fs);
    ffrsTemp = ffrsTemp';
    
    presTemp = subTemp.eeg(:,[1:ffrons-1]);
    presTemp = double(presTemp);
    presTemp = resample(presTemp',2000,fs);
    presTemp = presTemp';
    
    pres = [];
    ffrs = [];
    clss = [];
    for j=1:size(ffrsTemp,1)
        pre = presTemp(j,:);
        ffr = ffrsTemp(j,:) - mean(pre);
        pre = pre - mean(pre);
        cls = subTemp.sti(j);
        if max(abs(ffr))<35
           ffrs = [ffrs;ffr];
           pres = [pres;pre];
           clss = [clss;cls];
        end
    end
        
    cls = clss;
    nwsub = sub(2:end);
    save([pathout,nwsub],'ffrs','cls');
       
end


