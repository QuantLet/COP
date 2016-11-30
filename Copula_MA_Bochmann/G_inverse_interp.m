function x = G_inverse_interp(data, CDF, range_x)
% x = G_inverse_interp(data, CDF, range_x)
% function required to compute log likelihood of a factor copula

tmp1          = [range_x', CDF];
[~, tmp2, ~]  = unique(tmp1(:, 2),'first'); % identical values of CDF
tmp1          = tmp1(tmp2, :);
max_tmp       = (data > max(tmp1(:, 2)));
min_tmp       = (data < min(tmp1(:, 2)));
data(max_tmp) = max(tmp1(:, 2));
data(min_tmp) = min(tmp1(:, 2));

x             = interp1(tmp1(:, 2),tmp1(:, 1), data, 'pchip'); % piecewise cubic hermite interpolation

