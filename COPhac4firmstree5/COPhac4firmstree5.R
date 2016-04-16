rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
G3 = hac(type = 1,
         tree = list(list("Y1", "Y2",
                     list("Z3", "Z4", 3) , 2.5) ,
                     list("Z1", "Z2", 2) ,
                     list("X1", "X2", 2.4) ,
                     "X3", "X4", 1.5) )
# do plot
plot(G3 , digits = 2, theta = TRUE ,
     col = " blue3 ", fg = " red3 ",
     bg = " white ", col.t = " blue3 ")