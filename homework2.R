# Created by Konstantin Kuchenmeister on 10/11/2021
#
# homework2.R
#


library(fpp2)
data <- read.csv("/Users/konstantinkuchenmeister/Downloads/simu_sq.txt", sep="")
simu = ts(data)

### Plotting the data
plot.ts(simu)

### Taking the square root of the data
vec <- sqrt(simu)
plot.ts(vec)

### Moving average smoothing
mas5 <- filter(vec, filter = rep(1/5, 5), sides = 2)

plot.ts(vec)
lines(mas5, col="red")

legend("topleft", legend=c("Normalized data", "Moving Average (5)"),
       col=c("black", "red"), lty = 1:1, cex=1)

### Plotting the residuals
plot.ts(vec-mas5, col = "blue")

legend("topright", legend=c("MA Residual (xt-ut)"),
       col=c("blue"), lty=1:2, cex=1)


### Kernel smoothing
ks6 <- ksmooth(time(vec), vec, kernel = "normal", bandwidth=6)
plot.ts(vec)
points(ks6, col="red", cex=.4)

legend("topleft", legend=c("Normalized data", "Kernel Smoothing (6)"),
       col=c("black", "red"), lty = 1:1, cex=1)

### Plotting the residuals
plot.ts(vec-ks6$y, col="blue")
legend("topright", legend=c("KSmooth Residual (xt-ut)"),
       col=c("blue"), lty=1:2, cex=1)



### Parametric smoothing (1)
t = time(vec)
predictor1 = sin(2*pi / 24 * t)
predictor2 = cos(2*pi / 24 * t)

fit <- lm(vec ~ t + predictor1 + predictor2)

### Plotting the residuals
y_hat = vec - fit$fitted.values
plot.ts(y_hat)
legend("topright", legend=c("Parametric Residual"),
       col=c("black"), lty=1:2, cex=1)



### Spiked parametric

spike = as.numeric(t%%24==6)

fit_spiked = lm(vec ~ t + predictor1 + predictor2 + spike)
y_hat2 = vec - fit_spiked$fitted.values
plot.ts(y_hat2)



