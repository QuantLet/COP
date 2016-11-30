function pdf = pdf_factor_skewt_t_copula(x, theta, abscissas, weights)
% pdf = pdf_factor_skewt_t_copula(x, theta, abscissas, weights)
% function computes pdf of a skew t - t factor copula

[T, K] = size(x);
x      = x';
lambda = theta(1:K);

%lambda must be row vector
if size(lambda, 1) > size(lambda, 2)
    lambda = lambda';
end

nu  = 1/theta(end-1);
psi = theta(end);

tmp1 = skewtdis_inv(abscissas, nu, psi);
func = @(i) tpdf((bsxfun(@minus, x(i,:), lambda(i)*tmp1)), nu);

g = NaN(T, K);
f = NaN(length(abscissas), T, K);

for i = 1:K
    tmp2     = feval(func, i);
    g(:,i)   = sum(bsxfun(@times, weights, tmp2))';
    f(:,:,i) = tmp2;
end

ff  = sum(bsxfun(@times,weights,prod(f,3)));
pdf = (ff'./prod(g,2));