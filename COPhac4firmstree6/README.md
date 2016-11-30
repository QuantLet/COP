
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **COPhac4firmstree6** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet : COPhac4firmstree6

Published in : Copulae

Description : 'COPhac4firmstree6 is used to give a tree plot of a 5-dim HAC. Here the Gumbel
generator is used. The parameter for X3, X4, X4 equals 2.005 and for ((X3, X4, X5), X2, X1) is
1.005. In the plot all parameters have been transferred into the tau form.'

Keywords : HAC, copula, archimedean, gumbel, firms, tree

See also : COPhac4firmstree5

Author : Ostap Okhrin, Yafei Xu

Datafile : CopTreeFile

Submitted : Tue, November 06 2014 by Sergey Nasekin

Output : COPhac4firmstree6 returns a tree plot of a 5-dim HAC.

Example : A tree plot of a 5-dim HAC.

```

![Picture1](COPhac4firmstree6.png)


### R Code:
```r
rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
G2 = hac(type = 1, 
         tree = list(list ("X3", "X4", "X5", 2.005), "X2", "X1", 1.005))
# do plot
tree2str(hac = G2 , theta = TRUE, digits = 3)
plot(G2, digits = 3, index = TRUE, theta = FALSE)
```
