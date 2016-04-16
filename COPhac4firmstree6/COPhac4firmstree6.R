rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
G2 = hac(type = 1, 
         tree = list(list ("X3", "X4", "X5", 2.005), "X2", "X1", 1.005))
# do plot
tree2str(hac = G2 , theta = TRUE, digits = 3)
plot(G2, digits = 3, index = TRUE, theta = FALSE)