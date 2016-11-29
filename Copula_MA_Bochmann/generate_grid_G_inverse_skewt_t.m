function [grid_skewt_t] = generate_grid_G_inverse_skewt_t (nu_z, nu_eps, psi, range_x, range_lambda, abscissas, weights)
%USAGE : [grid_skewt_t] = generate_grid_G_inverse_skewt_t (nu_z, nu_eps, psi, range_x, range_lambda, abscissas, weights)

grid_skewt_t = NaN(length(range_x),length(range_lambda));

a = skewtdis_inv(abscissas, nu_z, psi);

Git = @(u,j) tcdf_modified((bsxfun(@minus,range_x,range_lambda(j).*a)), nu_eps);

parfor j = 1:length(range_lambda); %vectorize further?
    
    grid_skewt_t(:,j) = sum(bsxfun(@times,weights,feval(Git,abscissas,j)));
    
end