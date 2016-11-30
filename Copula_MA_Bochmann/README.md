
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **sim_estim_ms_skewtt_factorcop** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : sim_estim_ms_skewtt_factorcop

Published in : 'Bochmann, Paul 2016 Multivariate systemic risk - Evidence from a regime-switching
factor copula model (Master's Thesis)'

Description : Simulates and estimates Markov-switching skew t - t factor copulas with two regimes.

Keywords : 'copula, regime-switching, factor model, time-varying dependence, high-dimensional
dependence modeling'

Author : Paul Bochmann

Input: 
- T: number of observations
- loadings_s1: common factor loadings, first regime
- loadings_s2: common factor loadings, second regime
- df_s1: degree of freedom parameter, second regime
- df_s2: degree of freedom parameter, first regime
- skew_s1: skewness parameter, first regime
- skew_s2: skewness parameter, second regime
- p11, p22: transition matrix probabilities

Example: 
- T: 1000; % number of observations
- loadings_s1: [1 2 3]; % common factor loadings
- loadings_s2: [4 4 4]
- df_s1: 4; % degree of freedom parameters
- df_s2: 10
- skew_s1: -0.5; % skewness parameters
- skew_s2: 0
- p11: 0.99; % transition matrix probabilities
- p22: 0.98

```


### MATLAB Code:
```matlab
clc;
clear;
close all;

%% definition of parameters

T           = 1000; % number of observations
loadings_s1 = [1 2 3]; % common factor loadings
loadings_s2 = [4 4 4];
df_s1       = 4; % degree of freedom parameter
df_s2       = 10;
skew_s1     = -0.5; % skewness parameter 
skew_s2     = 0;
p11         = 0.99; % transition matrix probabilities
p22         = 0.98;

theta       = [loadings_s1, loadings_s2, 1/df_s1, 1/df_s2, skew_s1, skew_s2, p11, p22];
K           = length(loadings_s1);

%% simulation from a Markov-switching skewt t - t factor copula

p              = [theta(end-1), 1-theta(end-1); 1-theta(end), theta(end)]; % transition matrix
states         = sim_ms_states(T, 2, p); % simulation of states
simdata_state1 = empiricalCDF(sim_skewtt_factorcop([loadings_s1, 1/df_s1, skew_s1], K, T)); % simulation of copula data for each state
simdata_state2 = empiricalCDF(sim_skewtt_factorcop([loadings_s2, 1/df_s2, skew_s2], K, T));
simdata        = NaN(length(states), K);

for t = 1:length(states)
    if states(t, 1) == 1 %state1 
        simdata(t, :) = simdata_state1(t, :);
    else %state2
        simdata(t, :) = simdata_state2(t, :);
    end
end

%% estimation of a Markov-switching skew t - t factor copula 

% generate abscissas and weights for numerical integration, 50 abscissas
[abscissas,weights] = gauss_legendre(50, 0, 1);

% range for the inversion of x
range_x = [-1000, -500, -400, -300, linspace(-200, -40, 10), -30, linspace(-15, 15, 100),...
    30, linspace(40, 200, 10), 300, 400, 500, 1000];

% settings for optimization
startval              = theta;
lower                 = [zeros(1 ,2*K), 1/300, 1/300, -1, -1, 0, 0];
upper                 = [999*ones(1, 2*K), 1/3, 1/3, 1, 1, 1, 1];
options = optimoptions('fmincon');
options = optimoptions(options, 'Algorithm', 'interior-point', 'Display', 'iter', 'MaxIter', +Inf,...
    'MaxFunEvals', +Inf,'TolFun', 1e-04);

% estimate using fmincon
profile on
    [theta_hat, ~, exitflag] = fmincon(@(theta) loglik_ms_skewtt_factorcop(theta, simdata, range_x, abscissas, weights),...
        startval, [], [], [], [], lower, upper,[], options);
profile viewer

% final call to likelihood function
[LLF, LL, theta_hat_s1, theta_hat_s2, ppredict_1, ppredict_2, pfilter_1, pfilter_2, psmooth_1, psmooth_2] = loglik_ms_skewtt_factorcop(theta_hat, simdata, range_x, abscissas, weights);

```
