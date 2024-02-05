trials = 1:20;

for ii = 1:101
    subplot(12,9,ii);
 bar(trials, condition1(:,ii)/0.01,'histc');
 %title('Bin from '+ string(edges(ii)));
end
