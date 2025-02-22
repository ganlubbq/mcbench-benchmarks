% This is material illustrating the methods from the book
% Financial Modelling  - Theory, Implementation and Practice with Matlab
% source
% Wiley Finance Series
% ISBN 978-0-470-74489-5
%
% Date: 02.05.2012
%
% Authors:  Joerg Kienitz
%           Daniel Wetterau
%
% Please send comments, suggestions, bugs, code etc. to
% kienitzwetterau_FinModelling@gmx.de
%
% (C) Joerg Kienitz, Daniel Wetterau
% 
% Since this piece of code is distributed via the mathworks file-exchange
% it is covered by the BSD license 
%
% This code is being provided solely for information and general 
% illustrative purposes. The authors will not be responsible for the 
% consequences of reliance upon using the code or for numbers produced 
% from using the code. 



clear; clc;
%% Parameters
S = 100;                                   % Spot prices
T = 5;      % maturities

r = 0;                      % discount factors
d = 0;                              % dividends

titS = 'MC Variance Gamma with CIR stochastic clock';

legend_base = 'Base scenario';

C = 4.3574;
G = 5.1704;                            % CEV exponent base scenario
M = 5.6699;
kappa = 1;         % parameter of CIR
eta = 1;           % parameter of CIR
lambda = 1;        % parameter of CIR


%% Simulation parameters
NTime = 120; NSim = 1; NBatches = 1;        % Time steps for the overall process
NTime_clock = 10;                           % Time steps for the stochastic clock
                                            % in between the steps of the
                                            % overall process
K = ones(NTime+1,1);                        % Strike range base
K = T*cumsum(K)/(NTime+1);                  % Transform to Strike range
K1 = K(2:end);

rstream = RandStream('mt19937ar','Seed',12345);
rstreamstate = rstream.State;

PathS = MC_VGCIR(S,r,d,T,C,G,M,kappa,eta,lambda,NTime,NSim,NBatches);

%% Changing lambda
lambda_low = .5;
lambda_high = 2;

    rstream.State = rstreamstate;
    PathS_low = MC_VGCIR(S,r,d,T,C,G,M,kappa,eta,lambda_low,NTime,NSim,NBatches);
    rstream.State = rstreamstate;
    PathS_high = MC_VGCIR(S,r,d,T,C,G,M,kappa,eta,lambda_high,NTime,NSim,NBatches);
    
legend_low = 'Changing \lambda low';
legend_high = 'Changing \lambda high';

createfigure_path(K,PathS_low, PathS, PathS_high, titS, legend_low, legend_base, legend_high);

% calculate the returns
ReturnsS1_low = calcreturns(PathS_low,0);
ReturnsS1 = calcreturns(PathS,0);
ReturnsS1_high = calcreturns(PathS_high,0);

createfigure_returns(K1,ReturnsS1_low, ReturnsS1, ReturnsS1_high, titS, legend_low, legend_base, legend_high);
%% Changing lambda
eta_low = .5;
eta_high = 2;

    rstream.State = rstreamstate;
    PathS_low = MC_VGCIR(S,r,d,T,C,G,M,kappa,eta_low,lambda,NTime,NSim,NBatches);
    rstream.State = rstreamstate;
    PathS_high = MC_VGCIR(S,r,d,T,C,G,M,kappa,eta_high,lambda,NTime,NSim,NBatches);
    
legend_low = 'Changing \eta low';
legend_high = 'Changing \eta high';

createfigure_path(K,PathS_low, PathS, PathS_high, titS, legend_low, legend_base, legend_high);

% calculate the returns
ReturnsS1_low = calcreturns(PathS_low,0);
ReturnsS1 = calcreturns(PathS,0);
ReturnsS1_high = calcreturns(PathS_high,0);

createfigure_returns(K1,ReturnsS1_low, ReturnsS1, ReturnsS1_high, titS, legend_low, legend_base, legend_high);
%% Changing lambda
kappa_low = .5;
kappa_high = 2;

    rstream.State = rstreamstate;
    PathS_low = MC_VGCIR(S,r,d,T,C,G,M,kappa_low,eta,lambda,NTime,NSim,NBatches);
    rstream.State = rstreamstate;
    PathS_high = MC_VGCIR(S,r,d,T,C,G,M,kappa_high,eta,lambda,NTime,NSim,NBatches);
    
legend_low = 'Changing \kappa low';
legend_high = 'Changing \kappa high';

createfigure_path(K,PathS_low, PathS, PathS_high, titS, legend_low, legend_base, legend_high);

% calculate the returns
ReturnsS1_low = calcreturns(PathS_low,0);
ReturnsS1 = calcreturns(PathS,0);
ReturnsS1_high = calcreturns(PathS_high,0);

createfigure_returns(K1,ReturnsS1_low, ReturnsS1, ReturnsS1_high, titS, legend_low, legend_base, legend_high);

