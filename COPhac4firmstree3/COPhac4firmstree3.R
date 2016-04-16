
rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
data(finData)
X         = finData # read data set
eps       = X
result2   = estimate.copula (X = eps , type = 1, method = 1 , epsilon = 0.3,
                             agg.method = "mean", margins = "edf")
plot(result2)

