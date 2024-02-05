figure;

nTrials = size(data.spiketimes,2);

for i = 1:nTrials

sz = size(data.spiketimes{i},2);
single_trial = data.spiketimes{i};

plot(single_trial,ones(sz)*i, 'o');
hold on;
end

title('Neuron rasterplot')
xlabel('Time (ms)')
ylabel('Trial number')
hold off;