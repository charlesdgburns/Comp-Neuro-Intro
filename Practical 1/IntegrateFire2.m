function V = IntegrateFire2(Es, dt,tMax,tau_m,El,RI,Vth,Vreset,tau_s,RG,Pmax)
%% Integrating and Firing between two neurons.
% Input: sample rate and limit, neuronal parameters in SI units.
% output: membrane potential in Volts at each timepoint.

times = 0:dt:tMax;      %an array to index out the time passed
indices = 1:tMax/dt;    %an array for indexing

%initialising arrays
V1 = zeros(length(times),1); %membrane potential first neuron
V2 = zeros(length(times),1); %membrane potential second neuron

%initial conditions
tf1 = -1000; %assume we fired long ago
tf2 = -1000; %as above
V1(1) = Vreset + (Vth-Vreset)*rand(); %start between Vth and Vreset
V2(1) = Vreset + (Vth-Vreset)*rand(); %as above

    for i = indices
        Ps1 = Pmax*exp(-(times(i)-tf1)/tau_s); %prob. 1st synapse opens
        Ps2 = Pmax*exp(-(times(i)-tf2)/tau_s); %as above for 2nd synapse

        %Integrate: euler method on equation 1.3:
        V1(i+1)=V1(i)+dt*(El-V1(i)-RG*Ps2*(V1(i)-Es)+RI)/tau_m;
        V2(i+1)=V2(i)+dt*(El-V2(i)-RG*Ps1*(V2(i)-Es)+RI)/tau_m;

        if V1(i) > Vth
            V1(i+1)=Vreset;
            tf1 = times(i); %update timepoint of firing
        end

        if V2(i) > Vth
            V2(i+1)=Vreset;
            tf2 = times(i); %updtae timepoint of firing
        end
    end
V = [V1,V2];
end %end function definition
