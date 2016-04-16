rm(list = ls(all = TRUE))
# replace the path of the working directory if necessary
# setwd("C:/R") 
file.name   = "COPapp1prices.csv" # read data
X           = read.csv(file.name, header = FALSE) # read data set
rownames(X) = X[, 1]
X           = X[, -1]
where.put   = which(diff(as.numeric(format(as.Date(rownames(X), "%d.%m.%Y"),
                                           "%Y%m"))) != 0)
labels      = format(as.Date(rownames(X), "%d.%m.%Y"), "%b %Y")
# do plot
dev.new(width = 8, height = 8) 
layout(matrix(1:3, nrow = 3, byrow = T))

# plot 1
par(mai = (c(0.0, 0.55, 0.2, 0.1) + 0.3))
plot(as.numeric(X[, 1]), type = "l", lwd = 3, 
     ylab = paste("AAPL ", "(Price)", sep = ""), 
     axes = F, frame = T, cex.lab = 1.2)
axis(2, cex.axis = 1.2)
# plot 2
par(mai = (c(0.1, 0.55, 0.1, 0.1) + 0.3))
plot(as.numeric(X[, 2]), type = "l", lwd = 3, 
     ylab = paste("HP ", "(Price)", sep = ""), axes = F,
     frame = T, cex.lab = 1.2)
axis(2, cex.axis = 1.2)
# plot 3
par(mai = (c(0.3, 0.55, 0.0, 0.1) + c(0.1, 0.3, 0.3, 0.3)))
plot(as.numeric(X[, 3]), type = "l", lwd = 3, 
     ylab = paste("MSFT ", "(Price)", sep = ""),
     cex.axis = 1.2, cex.lab = 1.2, frame = T, axes = F)
axis(2, cex.axis = 1.2)
axis(1, at = where.put, labels = labels[where.put], cex.axis = 1.2)