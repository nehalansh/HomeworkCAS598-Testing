

function [Q_linear] = channel_flow_simulation(n,s0,L,B,beta)

P = B; % Wetted perimeter
alpha = (n*P^(2/3)/1.49/sqrt(s0))^beta;

% Discretization
dx = 1000; % [ft]
N_cell = L/dx; % Number of spatial cells
T_sim = 120; % Total simultion time [min]
dt = 1; % !!may need to convert to [second]!! try 0.5,3,6,12 [min]
nT = T_sim/dt; % Number of time steps

% Create variable to store Q
Q_linear = zeros(nT+1,N_cell+1);%including intial time step

%assign initial condition
Q_linear(1,:) = 2000; %[cfs]

%create boundary condition
T_initial = 0:1:T_sim;
Q_bc = 2000 + (6000/2)*(1 - cos(2*pi*T_initial/T_sim));

% Assgin boundary and inital condition
Q_linear(:,1) = Q_bc; % [cfs]
Q_nonlinear = Q_linear; % [cfs]

% Linear scheme %
% Loop over time
for it = 2:nT+1
    % Loop over space
    for ix = 2:N_cell+1
        numerator = dt*60/dx*Q_linear(it,ix-1)+alpha*beta*Q_linear(it-1,ix)*(Q_linear(it-1,ix)/2+Q_linear(it,ix-1)/2)^(0.6-1);
        denominator = dt*60/dx + alpha*beta*(Q_linear(it-1,ix)/2+Q_linear(it,ix-1)/2)^(beta-1);
        Q_linear(it,ix) = numerator/denominator;
    end
end

end