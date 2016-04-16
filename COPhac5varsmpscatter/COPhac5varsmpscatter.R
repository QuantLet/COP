# ------------------------------------------------------------------------------
# Book:         COP
# ------------------------------------------------------------------------------
# Quantlet:     COPhac5varsmpscatter
# ------------------------------------------------------------------------------
# Description:  COPhac5varsmpscatter gives a plot of pairwise scatter plot of an 
#               HAC sample with 5 dimensions and a Gumbel generator. The 
#               parameter for X3, X4, X4 equals 2.005 and for ((X3, X4, X5), X2,
#               X1) it is 1.005. According to these structure we construct an HAC
#               with a Gumbel generator. Then 1500 random numbers are drawn from
#               this HAC. Hence, for every variable we obtain 1500 numbers. Then
#               for each pair of two variables we can obtain a scatter plot. 
# ------------------------------------------------------------------------------
# Usage:        -
# ------------------------------------------------------------------------------
# Inputs:       -
# ------------------------------------------------------------------------------
# Output:       COPhac5varsmpscatter returns a plot of pairwise scatter plots
#               of an HAC sample with 5 dimensions and a Gumbel generator.         
# ------------------------------------------------------------------------------
# Example:                    
# ------------------------------------------------------------------------------
# See also:     -
# ------------------------------------------------------------------------------
# Keywords:     HAC, Hierarchical Archimedean Copula, copula, simulation, Gumbel
# ------------------------------------------------------------------------------
# Author:       Ostap Okhrin, Yafei Xu
# ------------------------------------------------------------------------------

# install.packages("HAC") # run this line to install neccesary package
rm(list = ls(all = TRUE))
# setwd("C: / ...") # please change your working directory
library(HAC)
G2 = hac(type = 1, tree = list(list ("X3", "X4", "X5", 2.005),
                               "X2", "X1", 1.005))
sample = rHAC(n = 1500 , hac = G2)
# do plot
pairs(sample , pch = 20)