rm(list = ls(all = TRUE))
# set the parameters and draw samples
n  = 100
x  = runif(min = -1, max = 1, n) # draw 100 random numbers from a uniform CDF
y  = rnorm(n, mean = 0, sd = 0.1) + x 
x  = c(x, 1.2)
y  = c(y, 10)
b1 = var(x, y) / var(x)
b0 = mean(y) - b1 * mean(x)
# do the right scatter plot
plot(x, y, type = "p", pch = 19, col = "red3")
lines(x = c(-1, 1), y = c(b0 - b1, b0 + b1), lwd = 2, col = "blue3")
abline(a = 0, b = 0, v = seq(-1, 1, by = 0.25), h = seq(0, 10, by = 2),
       col = "gray", lty = 3)
# compute correlations of Pearson, Kendall and Spearman
print(cor(x, y))
print(cor(x, y, method = "kendall"))
print(cor(x, y, method = "spearman"))