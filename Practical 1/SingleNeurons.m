%% Integrate and Fire model of a single neuron %%

%Initialise parameters%

struct.tau = 10 %Time constant in number of miliseconds 
struct.equilibrium = -70 %equilibrium in mV (also Vreset)
struct.threshold = -40 %threshold potential in mV
struct.resistance = 10 %mega Ohm resistance of membrane
struct.current = 3.1 %nano Ampere current at equilibrium
struct.timepoints = 1000 % dT in ms; millisecond temporal resolution.