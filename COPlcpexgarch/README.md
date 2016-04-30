
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcapfresults** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of Quantlet: COPlcpexgarch
 
Published in:     Copulae

Description:     'COPlcpexgarch fits to the daily returns of the exchange rates JPN/USD, GBP/USD and EUR/USD in the
                  time span [4.1.1999; 14.8.2009] a Garch(1,1) model and gives back the mu, the parameters of the model,
                  skewness and shape, Ljung-Box and the Kolmogorov-Smirnov test statistic. Also are given in the line
                  beneath of the values the corresponding standard deviations.'
  
Keywords:         HAC, clayton, gumbel, garch, exchange rates, returns

See also:         COPlcpeinaparch, COPlcpexVaR, COPlcpexres, COPlcpinVaR, COPlcpinres

Author:           Ostap Okhrin, Simon Trimborn

Datafile:         'COP_timeseries_2.dat'

Submitted:        Mon, September 15 2014 by Felix Jung
     
Output:          'Returns a table with the estimations of the mu, the parameters of the model, skewness and shape,
                  Ljung-Box and the Kolmogorov-Smirnov test statistic. Also are given in the line beneath of the 
                  values the corresponding standard deviations.'

Example:          see COPlcpexres


```



```r
rm(list=ls(all=TRUE))

# install.packages("fGarch")
# install.packages("QRM")
library(fGarch)
library(QRM)

#setwd("C:/...")        # please change your working directory

##### prepare data
X = read.csv("cop_timeseries_2", header = T, sep = "", dec=",")
X = X[,-1]
R = apply(log(X), 2, diff)

##### GARCH Fit

feps    = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
eps     = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
sigma.t = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
params  = matrix(nrow = 2 * dim(R)[2], ncol = 8)

for(i in 1:dim(R)[2]){
fit                  = garchFit(~garch(1, 1), data = R[,i], cond.dist = "sged", trace = F)
eps[,i]              = fit@residuals
sigma.t[,i]          = fit@sigma.t
eps[,i]              = eps[,i] / sigma.t[,i]
params[(2 * i - 1),] = c(fit@fit$coef, Box.test(eps[,i], type = "Ljung-Box",
    lag = 12)$p.value, ks.test(eps[,i], "pnorm")$p.value)
params[(2 * i),]     = c(fit@fit$matcoef[,2], NA, NA)
feps[,i]             = edf(eps[,i], adjust = TRUE)
}

colnames(params) = c("mu", "omega", "alpha1", "beta1", "skew", "shape", "BL", "KS")
rownames(params) = rep(colnames(R), each=2)
params
```
