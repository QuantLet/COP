# replace the path of the working directory if necessary
# setwd("C:/R") 
d         = read.csv("COPdax140624.csv") # pls download the pertinent data set.
DateInput = as.Date(d[, 1])
numOfDate = as.numeric(as.Date(c(DateInput)))
newDF     = data.frame(d, numOfDate)
sortNewDF = newDF[order(newDF[, 3]),]
newDF2    = data.frame(sortNewDF, seq(1, length(newDF[, 3]),
                       length.out = length(newDF[, 3])))
Pt        = newDF[, 2]
P1        = Pt[ - length(Pt)]
P2        = Pt[ - 1]
DAXreturn = log(P1/P2)
DAXreturn = data.frame(DAXreturn,length(DAXreturn):1)
DAXreturn = DAXreturn[order(DAXreturn[, 2]),]
DAXreturn = DAXreturn[, 1] * 100
r         = DAXreturn[ - which(DAXreturn >= 6.5 | DAXreturn <= - 6.5)]

# sample of Gaussian mu = 0.0002113130, sigmaSquare = 0.0002001865
rNorm     = 100 * rnorm(length(r), mean = 0.0002113130, sd = sqrt(0.0002001865))

# do plot
hist1 = hist(r, prob = TRUE, 12, freq = F, breaks = 24) 
hist2 = hist(rNorm, prob = TRUE, 12, freq = F, breaks = 24) 
plot(seq(-6.5, 6.5, length.out = 10), seq(0, .5, length.out = 10),
     ylab = "Density", xlab = "DAX Returns and Normal Simulations", col = "White", 
	 main = "Histogram of DAX Returns and Normal Simulations")
plot(hist1, col = rgb(0, 0, 1, 1 / 4), xlim = c(-6, 6), freq = F, add = T)  
plot(hist2, col = rgb(1, 0, 0, 1 / 4), xlim = c(-6, 6), add = T, freq = F)  
box()




