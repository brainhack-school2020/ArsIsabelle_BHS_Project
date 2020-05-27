

files = dir('*.mat');
for i=1:length(files)
    fname = files(i).name;
    load(fname);
    subNums(i) = str2double(fname(1:3));
    cleanffrs(i,:) = [length(find(cls==1)) length(find(cls==2))];
end

cleanffrs

min(cleanffrs)

idx = find(cleanffrs(:,1)>=2300&cleanffrs(:,2)>=2300);
temp = subNums(idx)'