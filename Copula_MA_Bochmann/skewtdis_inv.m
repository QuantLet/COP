function inv = skewtdis_inv(u, nu, lambda)
% inv = skewtdis_inv(u, nu, lambda)
% returns inverse of Hansen's skew t distribution´
% modified version of Andrew Patton's code

[T, K] = size(u);

if size(nu) ~= length(u);
   nu = nu(1)*ones(T, K);
end

if size(lambda)~=length(u);
   lambda = lambda(1)*ones(T, K);
end

c       = gamma((nu+1)/2)./(sqrt(pi*(nu-2)).*gamma(nu/2));
a       = 4*lambda.*c.*((nu-2)./(nu-1));
b       = sqrt(1 + 3*lambda.^2 - a.^2);

f1      = (u<(1-lambda)/2);
f2      = (u>=(1-lambda)/2);

inv1    = (1-lambda(f1))./b(f1).*sqrt((nu(f1)-2)./nu(f1)).*tinv(u(f1)./(1-lambda(f1)),nu(f1))-a(f1)./b(f1);
inv2    = (1+lambda(f2))./b(f2).*sqrt((nu(f2)-2)./nu(f2)).*tinv(0.5+1./(1+lambda(f2)).*(u(f2)-(1-lambda(f2))./2),nu(f2))-a(f2)./b(f2);

inv     = NaN*ones(T, K);
inv(f1) = inv1;
inv(f2) = inv2;