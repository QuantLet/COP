function [x, CDF] = G_inverse_skewt_t_factorcop(theta, data, range_x, abscissas, weights)
% [x, CDF] = G_inverse_skewt_t_factorcop(theta, data, range_x, abscissas, weights)
% function required to compute log-likelihood of a factor copula

[T, K] = size(data);

% collect parameters
lambda  = theta(1:K);
nu      = 1/theta(end-1);
psi     = theta(end);
tmp1    = skewtdis_inv(abscissas, nu, psi); % F_z = skew t
cdf_fun = @(i) tcdf((bsxfun(@minus, range_x,lambda(i).*tmp1)), nu); % F_e = t

% preallocate
CDF = NaN(length(range_x), K);
x   = NaN(T, K);

for i = 1:K
    CDF(:, i) = sum(bsxfun(@times, weights, feval(cdf_fun, i)))';
    x(:, i)   = G_inverse_interp(data(:, i), CDF(:, i), range_x);
end