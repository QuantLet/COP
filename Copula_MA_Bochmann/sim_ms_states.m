function States = sim_ms_states(T,n_states,p)
% States = sim_ms_states(T,K,p)
% based on MS Regress Package of Marcelo Perlin

Rnd = rand(T,1); % random seed for states transition (uniform probabilities)

% preallocate
States = zeros(T,n_states);

States(1,1) = 1;  % starting with state 1 for first obs

for t = 2:T  % Loop for construction of states (maybe vectorize later ??)
    state_past = find(States(t-1,:) == 1); %1,...,K
    if Rnd(t,1)<p(state_past,state_past) % staying at last state
        States(t,state_past) = 1; 
    else    % changing to other states
        idx_other = find(States(t-1,:)==0); % column indices of all states where model has not been in t-1
        Prob2 = p(state_past,:);
        
        a = [p(state_past,state_past), Prob2(idx_other)];

        cum_sum = cumsum(a);
        sorted = sort([cum_sum , Rnd(t,1)]); % to which state to switch

        idx = find(Rnd(t,1) == sorted)-1;      % find index
        States(t,idx_other(idx)) = 1;        % change state
    end
end