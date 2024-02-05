sta = zeros(size(data.stimulus_ft,1),15);

for i = 1:length(allspiketimes)
tm = allspiketimes(i);
col = ceil(tm/6.25);
sta = sta + data.stimulus_ft(:,[col-14:col]);

end

sta=sta/length(allspiketimes)

imagesc([-14*6.25,0], [f(1),f(end)], sta)
set(gca, 'Yscale','log','Ylim',[f(1),f(end)],'YTick',round(f))
axis xy
colormap(jet);
a = colorbar;
a.Label.String = 'Amplitude (dB)';
xlabel('Time relative to stimulus onset (ms)')
ylabel('Frequency (Hz)')
title('Spike Triggered Average stimulus spectogram')
