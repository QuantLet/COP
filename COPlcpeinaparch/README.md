
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcapfresults** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml
Name of Quantlet: COPlcpeinaparch
 
Published in:     Copulae

Description:     'COPlcpinaparch fits to the daily returns of the indices Dow Jones (DJ), DAX and NIKKEI in the 
                  time span [01.01.1985; 23.12.2010] a aparch(1,1) model and gives back the mu, the parameters 
                  of the model, skewness and shape, Ljung-Box and the Kolmogorov-Smirnov test statistic. Also 
                  are given in the line beneath of the values the corresponding standard deviations.'
  
Keywords:         HAC, clayton, gumbel,DAX, NIKKEI, Ljung-Box, Kolmogorov-Smirnov kendall

See also:         COPlcpexVaR, COPlcpexgarch, COPlcpexres, COPlcpinVaR, COPlcpinres, CRIXbic

Author:           Ostap Okhrin, Simon Trimborn

Submitted:        Mon, September 15 2014 by Felix Jung

Datafile:         COPIcpeinaparch.txt
     
Output:           Length, structure, parameters and ML for the copulas.

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
X = read.table("COPIcpeinaparch.txt", sep = ";", dec = ",", header = TRUE)
X = X[, -1]
R = apply(log(X), 2, diff)

##### GARCH Fit

feps    = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
eps     = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
sigma.t = matrix(nrow = dim(R)[1], ncol = dim(R)[2])
 params = matrix(nrow = 2*dim(R)[2], ncol = 10)

for(i in 1:dim(R)[2]){
  fit                  = garchFit(~aparch(1, 1), data = R[, i], cond.dist = "sstd", trace = F)
  eps[, i]             = fit@residuals
  sigma.t[, i]         = fit@sigma.t
  eps[, i]             = eps[,i] / sigma.t[, i]
  params[(2 * i - 1),] = c(fit@fit$coef, Box.test(eps[, i], type = "Ljung-Box",
    lag = 12)$p.value, ks.test(eps[, i], "pnorm")$p.value)
  params[(2 * i),]     = c(fit@fit$matcoef[,2], NA, NA)
  feps[, i]            = edf(eps[, i], adjust = TRUE)
}

colnames(params) = c("mu", "omega", "alpha1", "gamma1", "beta1", "delta", "skew", "shape", "BL", "KS")
rownames(params) = rep(colnames(R), each = 2)
params
```
