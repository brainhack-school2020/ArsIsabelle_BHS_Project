

% basics

    close all
    clear all

    pathin = 'results/';

% arrange results

    files = dir([pathin,'*.mat']);
    
    load([pathin,files(1).name]);
    listcls = intersect(rcls,rcls);
    
    for k=1:length(listcls)
        
    catid = k;

    for i=1:length(files)

      file = files(i).name;

      infos = regexp(file,'[0-9]*','match');

      subids(i) = str2double(infos{1});
      if subids(i)<200
      grp(i) = 1;
      else
      grp(i) = 0;
      end
      totsizes(i) = str2double(infos{3});

      load([pathin,file]);
      cp = classperf(rcls,pcls);
      
      idx = find(rcls==k);
      xcorrs1(i) = mean(xcors(idx,k));

    end

% plot results

    totList = intersect(totsizes,totsizes);
    grpList = intersect(grp,grp);

    figure;
    colors = [0 0 1;1 0 0];
    
    for j=1:length(grpList)
        
        grpid = grpList(j);

        for i=1:length(totList)

            idx = find(grp==grpList(j) & totsizes==totList(i));
            [~,mu(i),sig] = zscore(xcorrs1(idx));
            sem(i) = sig/sqrt(length(idx));
            xlabels{i} = num2str(totList(i));
            tests{i,j} = xcorrs1(idx);

        end
        
        errorbar([1:i],mu,sem,'linewidth',3,'color',colors(j,:));
        hold on
        
    end
        
    for i=1:size(tests,1)
    [~,ps(i)] = ttest2(tests{i,1},tests{i,2}); 
    if ps(i)<0.05
    plot(i,-35,'k*','markersize',20);
    end
    end
    
    set(gca,'linewidth',3,'fontsize',20,'xlim',[0.5 i+0.5],...
    'xtick',[1:1:i],'xticklabels',xlabels);
    box off;

    set(gcf,'position',[100 100 800 600])
    saveas(gcf,['figures/resultsXcorrscls',num2str(catid),'.tif']);
    
    end


  
  
  
