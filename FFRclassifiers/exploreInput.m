

close all
clear all

% one subject

pathin = 'input1/';
subName = '101.mat';

load([pathin,subName]);

clsList = intersect(cls,cls);

for i=1:length(clsList)
    
    idx = find(cls==clsList(i));
    aveffr = mean(ffrs(idx,:));
    plotSpec(aveffr,2000,[0 1000],0.04,0.039);
    saveas(gcf,['figures/oneSubjectFFRcls',num2str(i),'.tif']);
     
end

% all subjects

subs = dir([pathin,'*.mat']);

for j=1:length(clsList)
    
    ffrscum = [];

    for i=1:length(subs)

        sub = subs(i).name;
        load([pathin,sub]);
        
        idx = find(cls==clsList(j));

        ffrscum = [ffrscum;ffrs(idx,:)];
        
    end
    
    aveffr = mean(ffrscum);
    plotSpec(aveffr,2000,[0 1000],0.04,0.039);
    saveas(gcf,['figures/allSubjectFFRcls',num2str(j),'.tif']);

end

% stimuli

[s fs] = audioread('stims/syllPos.wav');
s = resample(s(:,1),2000,fs);
plotSpec(s,2000,[0 1000],0.04,0.039);
saveas(gcf,['figures/syll.tif']);

[s fs] = audioread('stims/tonePos.wav');
s = resample(s(:,1),2000,fs);
plotSpec(s,2000,[0 1000],0.04,0.039);
saveas(gcf,['figures/piano.tif']);

