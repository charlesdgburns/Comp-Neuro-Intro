
for ii = 1:20
 subplot(5,4,ii);
 bar(edges, condition1(ii,:)/0.01,'histc');
end
