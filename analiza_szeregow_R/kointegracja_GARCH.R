######################################################
###    Kointegracja
######################################################


# Regresja pozorna

library(lmtest)

e1 <− rnorm(500)
e2 <− rnorm (500)
trd <− 1:500
y1 <− 0.8 ∗ trd + cumsum(e1)
y2 <− 0.6 ∗ trd + cumsum(e2)
sr.reg <− lm(y1 ~ y2)
summary(sr.reg)
dwtest(sr.reg)

# Kointegracja - przykład

library(tseries)

mu <- numeric(1000)

# Błądzenie losowe
for (i in 2:1000) mu[i] <- mu[i - 1] + rnorm(1)

# Dwie zmienne z tym samym trendem stochastycznym
x <- mu + rnorm(1000)
y <- mu + rnorm(1000)


adf.test(x)
adf.test(y)


#Test kointegracji
po.test(cbind(x, y))

#Regresja
reg <- lm(y~x)
reg
summary(reg)

ee <- residuals(reg)
adf.test(ee)

#Kursy wymiany
load("xrates.Rd")
str(xrates)
plot(xrates$EUR, type="l")
plot(xrates$GBP, type="l")


adf.test(xrates$EUR)
kpss.test(xrates$EUR)
adf.test(xrates$GBP)
kpss.test(xrates$GBP)

reg <- lm(EUR~GBP, xrates)
reg

adf.test(residuals(reg))
kpss.test(residuals(reg))

dd <- xrates[,-1]
po.test(dd)




######################################################
###    GARCH
######################################################
x <- EuStockMarkets[,1]
plot(x, ylab="Index", main="DAX")
plot(diff(log(x)), ylab="returns", main="DAX")
str(EuStockMarkets)
names(EuStockMarkets)


returns <- diff(log(x))
acf(returns)
pacf(y)

returns2 <- returns^2
plot(returns2)
acf(returns2)
pacf(returns2)

?garch

rm(list=ls())
library(fGarch)

m <- garchSpec(list(alpha=c(0.2, 0.1), beta=c(0.3)))
x <- garchSim(m, n = 1000)
plot(x)

garch(returns)