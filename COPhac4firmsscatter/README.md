
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **COPhac4firmsscatter** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet : COPhac4firmsscatter

Published in : Copulae

Description : 'COPhac4firmsscatter gives pairwise scatterplots from ARMA-GARCH residuals provided
from the HAC package, including Chevron Corporation (CVX), Exxon Mobil Corporation (XOM), Royal
Dutch Shell (RDSA) and Total (FP) covering n = 283 observations from 2011-02-02 to 2012-03-19.'

Keywords : correlation, scatterplot, firms, Chevron, Exxon Mobil, Royal Dutch, energy, oil

See also : MMSTATlinreg, MMSTATscatterplot

Author : Ostap Okhrin, Yafei Xu

Submitted : Tue, November 18 2014 by Franziska Schulz

Output : 'The Quantlet returns pairwise scatter plots from ARMA-GARCH residuals, including CVX, FP,
RDSA, XOM.'

```

![Picture1](COPhac4firmsscatter.png)


### R Code:
```r
rm(list = ls(all = TRUE))
#install.packages("HAC")
library(HAC)
data(finData)
X         = finData # read data set
eps       = X
# do plot
pairs(eps, pch = 20)




```
