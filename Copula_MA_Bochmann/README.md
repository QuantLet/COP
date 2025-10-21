<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: sim_estim_ms_skewtt_factorcop

Published in: Bochmann, Paul 2016 Multivariate systemic risk - Evidence from a regime-switching factor copula model (Master''s Thesis)

Description: Simulates and estimates Markov-switching skew t - t factor copulas with two regimes.

Keywords: copula, regime-switching, factor model, time-varying dependence, high-dimensional dependence modeling

Author: Paul Bochmann

Submitted: 29.11.2016

Input: 
- T: number of observations
- loadings_s1: common factor loadings, first regime
- loadings_s2: common factor loadings, second regime
- df_s1: degree of freedom parameter, second regime
- df_s2: degree of freedom parameter, first regime
- skew_s1: skewness parameter, first regime
- skew_s2: skewness parameter, second regime
- p11, p22:  transition matrix probabilities

Example: 
- T:           '1000; % number of observations'
- loadings_s1: '[1 2 3]; % common factor loadings'
- loadings_s2: '[4 4 4]'
- df_s1:       '4; % degree of freedom parameters'
- df_s2:       10
- skew_s1:     '-0.5; % skewness parameters'
- skew_s2:     0
- p11:         '0.99; % transition matrix probabilities'
- p22:         0.98

```
