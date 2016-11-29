function X = sim_skewtt_factorcop(theta,K,S,seed)
% X = sim_different_weights(theta, K, S ,seed)
% simulate K*S data from skewt t factor model

% seed seed = 1 if no seed provided 
if nargin == 3;
    seed = 1;   
end

rng(seed, 'twister');

% simulate
if length(theta) ~= K+2
    error('check theta!') 
else 
    inv_nu = theta(end-1);
    skew   = theta(end);
    beta   = theta(1:K);
    eps    = trnd(1/inv_nu, S, K); % simulate epsilon from t distribution
    Z      = skewtdis_rnd(1/inv_nu, skew, S, seed)'; % simulate skew - t common factor
    X      = NaN(S, K);
    for i = 1:K
        X(:, i) = beta(i)*Z' + eps(:, i);
    end;
end;