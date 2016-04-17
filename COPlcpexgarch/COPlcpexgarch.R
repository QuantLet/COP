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
