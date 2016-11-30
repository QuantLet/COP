function out1 = skewtdis_rnd(nu, lambda, T, state)
% out1 = skewtdis_rnd(nu, lambda, T, state)
% simulates from Hansen's skew t distribution
% modified version of Andrew Patton's code

if nargin<4
   rand('state', sum(1234*clock));	% setting RNG to new seed according to computer clock time.
else
   rand('state', state);
end
if size(nu, 1)<T;
   nu = nu(1)*ones(T, 1);
end
if size(lambda, 1)<T;
   lambda = lambda(1)*ones(T, 1);
end
u    = rand(T, 1);
out1 = skewtdis_inv(u, nu, lambda);