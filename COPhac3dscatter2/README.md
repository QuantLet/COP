
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MVApcapfresults** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml


```yaml
Name of Quantlet: COPhac3dscatter2
 
Published in:     Copulae

Description:     'COPhac3dscatter2 gives samples generated from an hierarchical Archimedean copula (HAC),
                  where the red points stand for the 1100 scatter points drawn from the HAC. The generator
                  of this HAC is Gumbel and the marginals here contain the Student-t CDF for variable x1,
                  the normal CDF for x2 and the normal CDF for x3. The parameter for x1 and x3 in the first
                  hierarchy is 10 and in the second hierarchy the parameter is 2. The blue points on the 
                  vertical plane stand for the projection of the red points onto the plane x1 and x3. The 
                  blue points on the bottom plane stand for the projection of the red points onto the plane
                  x1 and x2.'
  
Keywords:         HAC, copula, gumbel, scatterplot, 3D, Archimedean

Author:           Ostap Okhrin, Yafei Xu

Datafile:         COPdax140624.csv

Submitted:        Mon, November 10 2014 by Franziska Schulz
     
Output:          'COPhac3dscatter2 gives a 3D scatter plot with samples generated from an HAC copula.'


```

!{Picture1](COPhac3dscatter2.png)

```r
rm(list = ls(all = TRUE))
#setwd("C:/...") # please change your working directory
# install packages
# install.packages("copula")
library(copula)
# install.packages("scatterplot3d")
library(scatterplot3d)
set.seed(12345)

# draw sample from HAC
theta1 = 10
theta2 = 2
C3     = onacopula("G", C(theta2, 2, C(theta1, c(1, 3))))
U      = rCopula(1100, C3)
x1     = qt(U[, 1], df = 17)
x2     = qnorm(U[, 2])
x3     = qnorm(U[, 3])
d      = data.frame(x1, x2, x3)
d      = d[-which(d[, 1] > 3 | d[, 1] < -3), ]
d      = d[-which(d[, 2] > 3 | d[, 2] < -3), ]
d      = d[-which(d[, 3] > 3 | d[, 3] < -3), ]

# do plot
s3d = scatterplot3d(d[, 1], d[, 2], d[, 3],
                      main = "Hierarchical Archimedean Copula", 
					  pch = 16, zlab = "", ylab = "", xlab = "",
					  sub = expression(italic(C)[Gumbel] * group("[",
					                   Phi(x[2]) * ", " * italic(C)[Gumbel] *
									   group("{", t[2](x[1]) * ", " *
									   Phi(x[3]) * "; " * theta[1] == 10,
									   "}") * "; " * theta[2] == 2, "]")*
									   ", " * s == (2 * (1 * 3))))
s3d$points3d(d[, 1], d[, 2], seq(min(floor((d[, 3]))),
             min(floor((d[, 3]))), length.out = length(d[, 3])),
			 col = "lightblue", pch = 16)
s3d$points3d(seq(min(floor((d[, 1]))), min(floor((d[, 1]))), 
             length.out = length(d[, 3])), d[, 2], d[, 3], 
			 col = "lightblue", pch = 16)
s3d$points3d(d[, 1], d[, 2], d[, 3], col = "red", pch = 16)
text(s3d$xyz.convert(0, -2.5, -3),
labels = expression(x[1]))
text(s3d$xyz.convert(2.5, 0.5, -3),
labels = expression(x[2]))
text(s3d$xyz.convert(2.75, 3, 0),
labels = expression(x[3]))
s3d$box3d()





```
