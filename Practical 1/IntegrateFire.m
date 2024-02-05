function V = IntegrateFire(dt,tMax,tau_m,El,Rm,I,Vfire)
%%Input: sample rate and limit, neuronal parameters (SI units). 
%output: membrane potential at each timepoint (Volts).

times = 0:dt:tMax; %timepoints we sample at in seconds.
indices = 1:tMax/dt; %we index in integer steps.
V = zeros(length(indices),1); %initialise voltage collected at each t
V(1) = El; %we assume that V(0) is the equillibrium potential.
%We also assume there is no refractory period.

for (i = indices)
    
    V(i+1)=V(i)+dt*(El-V(i)+Rm*I)/tau_m; %Integrate: equation 1.1

    if V(i) > Vfire %Fire:
      V(i+1) = El; %we reset V (going back to equillibrium).
    end %end if statement
end %end for loop
end %end function definition
