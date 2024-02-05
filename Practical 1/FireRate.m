function N = FireRate(times, a, weights, inputs)
%% Simulates a simple firing rate model 
% Input: timesteps (1xdt*tMax array), leak loss (constant), weights (2x2 array), and input currents (2x1 array) 
% Output: a 'times' x 2 array with firing rate for each neuron.

%initialise

N = zeros(length(times), 2);

N(1,1) = 10; %starting firing rate of first neuron
N(1,2) = 10; %starting firing rate of second neuron

for i = times

    %simulate firing rate of neuron 1
    N(i+1,1) = N(i,1) +0.01*(-a*N(i,1)+weights(1,1)*N(i,1)+weights(1,2)*N(i,2)+inputs(i,1));
    %neuron 2:
    N(i+1,2) = N(i,2) +0.01*(-a*N(i,2)+weights(2,1)*N(i,1)+weights(2,2)*N(i,2)+inputs(i,2));

    if N(i+1,1)>= 100
        N(i+1,1) = 100;
    end

    if N(i+1,2)>= 100
        N(i+1,2) = 100;
    end

    if N(i+1,1) <= 0
        N(i+1,1) = 0;
    end
    
    if N(i+1,2) <= 0
        N(i+1,2) = 0;
    end

end

end