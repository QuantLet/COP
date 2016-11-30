function out1 = empiricalCDF(data,x)
% Computes empirical probability integral transform
% modified version of Andrew Patton's codes

[T, k] = size(data);
if nargin<2
   out1 = NaN*ones(T, k);
   for jj = 1:k
      temp        = [data(:,jj), (1:1:T)'];
      temp2       = sortrows(temp, 1);	
      temp3       = [temp2, (1:1:T)'/(T+1)];		% dividing by T+1 rather than T so that none equals 1
      temp4       = sortrows(temp3, 2);
      out1(:, jj) = temp4(:, 3);
   end
else
   [q, q2] = size(x);
   if q2==1
      x = x*ones(1, k);
   end
   out1 = NaN*ones(q, k);
   for jj = 1:k
      for ii = 1:q
         out1(ii, jj) = mean(data(:, jj)<=x(ii, jj));
      end
   end
end