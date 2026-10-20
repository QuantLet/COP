<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of Quantlet: COPlcpexVaR

Published in: Copulae

Description: COPlcpexVaR computes from the results of fitting a Garch(1, 1) model to daily returns, see COPlcpexgarch, and choosing the HAC model, see COPlcpexres, the profit and loss function (dots) with the 99%-VaR bound (solid line) and the time points of the exceedances (pluses).

Keywords: HAC, clayton, gumbel, kendall, multivariate, gaussian, gauss

See also: COPlcpeinaparch, COPlcpexgarch, COPlcpexres, COPlcpinVaR, COPlcpinres

Author: Ostap Okhrin

Datafile: COPts2AClayton.dat, COPts2AGumbel.dat, COPts2dates.dat, COPts2eps.dat, COPts2parameters.dat, COPts2sigmat.dat, cop_timeseries_2

Submitted: Tue, October 07 2014 by Felix Jung

Input: COPhelperfunctions

Output: The Quantlet returns plots which show the profit and loss function (dots) for exchange rates with the 99%-VaR bound (solid line) and the time points of the exceedances (pluses) for the HAC model with Gumbel and Clayton generators

Example: see COPlcpexres

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/COP/master/COPlcpexVaR/Claytonscatter.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/COP/master/COPlcpexVaR/Gumbelscatter.png" alt="Image" />
</div>

