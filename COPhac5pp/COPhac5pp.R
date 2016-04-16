# install.packages(c("HAC")) # run this line to install necccesary package
rm(list = ls(all = TRUE))
# setwd("C: / ...") # please change your working directory
library(HAC)
G2 = hac(type = 1, tree = list(list ("X3", "X4", "X5", 2.005),
                               "X2", "X1", 1.005))
sample = rHAC(n = 1500 , hac = G2)
# compute sample's theoretical probability
cf.values = pHAC(X = sample , hac = G2)
# compute sample's empirical probability
ecf.values = emp.copula.self(x = sample, proc = "M", 
                             sort = "none", na.rm = FALSE)
# do plot
True_Probabilities = Empirical_Probabilities = seq(0, .9, length.out = 100)
plot(True_Probabilities, Empirical_Probabilities, col = "white",
     xlab = "True Probabilities", ylab = "Empirical Probabilities")
points(cf.values, ecf.values, pch = 20, col = "black")
lines(True_Probabilities, Empirical_Probabilities, col = "red")