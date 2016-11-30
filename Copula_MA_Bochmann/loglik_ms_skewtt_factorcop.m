function [LLF, LL, theta_s1, theta_s2, ppredict_1, ppredict_2, pfilter_1, pfilter_2, psmooth_1, psmooth_2] = loglik_ms_skewtt_factorcop(theta, data, range_x, abscissas, weights)
% [LLF, LL, theta_s1, theta_s2, ppredict_1, ppredict_2, pfilter_1, pfilter_2, psmooth_1, psmooth_2] = loglik_ms_skewtt_factorcop(theta, data, range_x, abscissas, weights)
%
% INPUTS: theta      =  [loadings for both states,
%                        inverse df parameters for both states,
%                        skewness parameters for both states,
%                        p11, p22];
%
%          data      = T*K uniform data
%          range_x   = range for numerical inversion of x
%          abscissas = abscissas for numerical integration
%          weights   = weights for numerical integration
%
% OUTPUTS: LLF            = negative log-likelihood value
%          LL             = scores
%          theta_state    = parameters in each state
%          ppredict_state = predicted probabilities in each state
%          pfilter_state  = filtered probabilities
%          psmooth        = Smooth Probabilities

T = size(data,1);
K = size(data,2);

if size(theta)~= 2*K+6;
    error('check size of theta');
end

% collect parameters
lambda_s1 = theta(1:K);
lambda_s2 = theta((K+1):2*K);
nu_s1     = 1/(theta(end-5));
nu_s2     = 1/(theta(end-4));
psi_s1    = theta(end-3);
psi_s2    = theta(end-2);
p11       = theta(end-1); % transition matrix probabilities
p22       = theta(end);

% reorganize parameters for call to pdf
theta_s1 = [lambda_s1, 1/nu_s1, psi_s1]; % [loadings, inverse df for z and eps, skew for z]
theta_s2 = [lambda_s2, 1/nu_s2, psi_s2]; % [loadings, inverse df for z and eps, skew for z]

% obtain x, using state dependent inverse of Git
x_s1 = G_inverse_skewt_t_factorcop(theta_s1, data, range_x, abscissas, weights);
x_s2 = G_inverse_skewt_t_factorcop(theta_s2, data, range_x, abscissas, weights);

% obtain pdf for each state
pdf_s1 = pdf_factor_skewt_t_copula(x_s1, theta_s1, abscissas, weights);
pdf_s2 = pdf_factor_skewt_t_copula(x_s2, theta_s2, abscissas, weights);

% hamilton and kim filtering/smoothing algorithms
[ppredict_1, ppredict_2, pfilter_1, pfilter_2, psmooth_1, psmooth_2] = hamilton_kim(pdf_s1, pdf_s2, p11, p22);

% get scores and log likelihood
LL  = log(pdf_s1.*ppredict_1 + pdf_s2.*ppredict_2);
LLF = -sum(LL);

if isreal(LLF)==0;
   LLF = 1e7;
elseif isnan(LLF)
   LLF = 1e8;
elseif isinf(LLF)
   LLF = 1e9;
end
