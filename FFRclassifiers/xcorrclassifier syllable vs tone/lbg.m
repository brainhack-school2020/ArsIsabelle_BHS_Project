

function cb = lgb(dtp,ncw)
    
    % initialize variables
      eps = 0.1;
      cb(1,:) = mean(dtp);                                                  % initial codeword (the mean)
      step = 1;
      stop = 0;
      len = 1;
      
      
    % Random selection of 10e5 is sample size is pretty big
      n = 10e5;
      if size(dtp,1) > n                                                    
      idx = randperm(size(dtp,1));                                          
      dtp = dtp(idx(1:n));
      end
      
   
    % lbg loop
      while (size(cb,1)<ncw) & (stop<9)                                   
        
        % split largest cell into 2 sub-cells
          cb(end,:) = cb(end,:) + eps;
          cb(end+1,:) = cb(end,:) - eps;
        
        % voronoi partition
          d = pdist2(dtp,cb);
          [~,idx] = min(d');
          vor = idx;
                
        % cell realocation
          for i=1:size(cb,1)     
          idx = find(vor==i);
          cb(i,:) = mean(dtp(idx,:));    
          end
        
          idx = find(isnan(cb(:,1))==0);                                    % get rid of empty cells
          cb = cb(idx,:);
        
        % voronoi partition
          d = pdist2(dtp,cb);
          [~,idx] = min(d');
          vor = idx;
        
        % select cell with highest dispersion
          for i=1:size(cb,1)      
          idx = find(vor==i);
          stds(i) = prod(std(dtp(idx,:)));                                  % estimate cell size as the product of std across dims 
          end
        
          idx = find(isnan(stds)==0);                                       % get rid of empty cells
          cb = cb(idx,:);
          stds = stds(idx);
        
          [~,idx] = sort(stds);                                             % sort cells by size
          cb = cb(idx,:);                                                   % sort codewords by the size of their current cells (codewords=centroids)
        
        % update counter to stop LBG
          len = [len size(cb,1)];
          if len(end) == len(end-1)
          stop = stop + 1;
          else
          stop = 0;
          end
                        
    end
          
end

