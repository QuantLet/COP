rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
data(finData)
X         = finData # read data set
eps       = X
# do plot
pairs(eps, pch = 20)



