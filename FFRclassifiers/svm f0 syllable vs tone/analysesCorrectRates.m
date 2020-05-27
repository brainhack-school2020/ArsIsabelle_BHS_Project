

% basics

    close all
    clear all

    pathin = 'results/';
    chance = 0.50;

% arrange results

    subs = dir([pathin,'*.mat']);

    for i=1:length(subs)

      sub = subs(i).name;

      infos = regexp(sub,'[0-9]*','match');

      subids(i) = str2double(infos{1});
      if subids(i)<200
      grp(i) = 1;
      else
      grp(i) = 0;
      end
      totsizes(i) = str2double(infos{3});

      load([pathin,sub]);
      cp = classperf(rcls,pcls);
      crates(i) = cp.CorrectRate;
      
    end

% plot results overal crate

    totList = intersect(totsizes,totsizes);
    grpList = intersect(grp,grp);

    figure;
    colors = [0 0 1;1 0 0];
    
    for j=1:length(grpList)
        
        grpid = grpList(j);

        for i=1:length(totList)

            idx = find(grp==grpList(j) & totsizes==totList(i));
            [~,mu(i),sig] = zscore(crates(idx));
            sem(i) = sig/sqrt(length(idx));
            xlabels{i} = num2str(totList(i));
            ttests{i,j} = crates(idx);

        end
        
        errorbar([1:i],mu,sem,'linewidth',3,'color',colors(j,:));
        hold on
        
    end
    
    plot([1 i],[chance chance],'k--','linewidth',2);
    
    for i=1:size(ttests,1)
    [~,ps(i)] = ttest2(ttests{i,1},ttests{i,2}); 
    if ps(i)<0.05
    plot(i,1,'k*','markersize',20);
    end
    end
    
    set(gca,'linewidth',3,'fontsize',20,'xlim',[0.5 i+0.5],...
    'xtick',[1:1:i],'xticklabels',xlabels,'ylim',[0 1]);
    box off;
    xlabel('Size','fontsize',20,'fontweight','bold');
    ylabel('CorrectRate','fontsize',20,'fontweight','bold');
    
    set(gcf,'position',[100 100 800 600])
    saveas(gcf,'figures/overalacc.tif');
    

  
  
  
