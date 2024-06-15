rm(list=ls())

#Symulacja szeregów
N <- 100
#Modele AR
model <- list(order=c(1, 0, 0), ar=c(0.3))
x <- arima.sim (model, N)
plot(x)
acf(x)
pacf(x)


model <- list(order=c(4, 0, 0), ar=c(0.3, -0.1, 0.2, 0.2))
x <- arima.sim (model, N)
plot(x)
acf(x)
pacf(x)


#Modele MA
model <- list(order=c(0, 0, 1), ma=c(-0.7))
x <- arima.sim (model, N)
plot(x)
acf(x)
pacf(x)


model <- list(order=c(0, 0, 3), ma=c(-0.1, 0.2, -0.5))
x <- arima.sim (model, N)
plot(x)
acf(x)
pacf(x)


#Modele ARMA
model <- list(order=c(2, 0, 1), ar=c(0.8, -0.2), ma=0.7)
x <- arima.sim (model, N)
plot(x)
acf(x)
pacf(x)

#Teoretyczne współczynniki autokorelacji
acf.t <- ARMAacf(ar=c(-0.4, 0.3), lag.max = 10, pacf=FALSE)
pacf.t <- ARMAacf(ar=c(-0.4, 0.3), lag.max = 10, pacf = TRUE)

barplot(acf.t)
barplot(pacf.t)



acf.t <- ARMAacf(ma=c(-0.4, 0.3), lag.max = 10, pacf=FALSE)
pacf.t <- ARMAacf(ma=c(-0.4, 0.3), lag.max = 10, pacf = TRUE)

barplot(acf.t)
barplot(pacf.t)




# analiza danych sztucznie wygenerowanych

# szum losowy

x1 <- rnorm(50, mean = 0, sd = 3)

# szereg autoregresyjny

x2 <- filter(x1, c(0.5, 0.3), method="recursive", sides = 1)

# błądzenie losowe

x3 <- c(0, cumsum(x1))


# model generowany funkcją 'arima.sim'

x.sim <- arima.sim(model = list(ar=c(0.4, 0.2), ma = c(0.7)), n=50)
tsdisplay(x.sim)

# analizy
library(forecast)


tsdisplay(x1)
tsdisplay(x2)
tsdisplay(x3)
tsdisplay(x.sim)


# sprawdzanie stacjonarności szeregów

# test Dickeya-Fullera (H0: brak stacjonarności)

library(tseries)
adf.test(x1)
adf.test(x2)
adf.test(x3)
adf.test(x.sim)


# test KPSS (H0: stacjonarność)

kpss.test(x1)
kpss.test(x2)
kpss.test(x3)
kpss.test(x.sim)


# szereg x3 - błądzenie losowe
adf.test(x3)
kpss.test(x3)

# na pewno nie jest stacjonarny
# wykonujemy różnicowanie

x3.dif <- diff(x3)
adf.test(x3.dif)
kpss.test(x3.dif)


# estymacja parametrów

ar(x1)
ar(x2)
ar(x3)

#spróbujmy oszacować parametry dla x3
mod <- arima(x2, order = c(2, 0, 1))
mod
plot(mod)

# sprawdzamy reszty
plot(mod$residuals)
tsdisplay(mod$residuals)

# test autokorelacji dla reszt (H0: brak zależności)
Box.test(mod$residuals, type = "Ljung-Box")
Box.test(mod$residuals, type = "Box-Pierce")

# wykresy diagnostyczne dla modelu
tsdiag(mod)


# wykorzystanie funkcji 'Arima' (pakiet 'forecast')
mod1 <- Arima(x2, order=c(2, 0, 1))

tsdiag(mod1)


# Automatyczny wybór modelu (pakiet 'forecast')
auto.arima(x2)


# Prognoza na podstawie modelu
progn1 <- forecast(mod1, h=10)
progn1
plot(progn1)


# Testowanie modelu na zbiorze testowym
library(TSstudio)

ts_split(x2)

train <- ts_split(x2)$train
test <- ts_split(x2)$test
mm <- auto.arima(train)
ff <- forecast(mm, h=length(test))
test_forecast(x2, ff, test=test)



###########################################


#Przykładowy szereg
help(Nile)
x <- Nile

x
plot(x)
acf(x)
pacf(x)


library(tseries)
tsdisplay(x)


#Stacjonarność
# sprawdzanie stacjonarności szeregów


# test Dickeya-Fullera (H0: brak stacjonarności)
library(tseries)
adf.test(x)

# test KPSS (H0: stacjonarność)
kpss.test(x)



#Dopasowywanie modeli

model1 <- ar(x, order.max=1)
model2 <- ar(x, order.max=11, aic=FALSE)
model3 <- ar(x, aic = TRUE)


model1
model2
model3


#Pakiet 'forecast'
library(forecast)
model1 <- Arima(x, order=c(2, 0, 2))
model1
summary(model1)


#testy diagnostyczne
res <- model1$residuals

plot(res)
acf(res)
pacf(res)

Box.test(res)
Box.test(res, type="Ljung-Box")

hist(res)
qqnorm(res)
shapiro.test(res)

tsdiag(model1)


#Dobór modelu
model <- auto.arima(x)
model

model <- auto.arima(x, ic="bic")
model
