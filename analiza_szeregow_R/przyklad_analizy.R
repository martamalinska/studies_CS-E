x <- AirPassengers
x

#wykresy szeregu
plot(x)
library(forecast)
tsdisplay(x)

#wykresy pokazujące zależności czasowe
lag.plot(x, lags=12)

monthplot(x)
seasonplot(x)


# autokorelacja i sezonowość roczna. Sezonowość multiplikatywna
# Trend liniowy lub wykładniczy.


y <- window(x, end=c(1958,12)) # zbiór uczący
y
z <- window(x, start=c(1959,1)) # zbiór testowy
z



## Prognoza naiwna
forecast.naive <- naive(y, 24)
forecast.naive
plot(forecast.naive)


#Prognoza z sezonowością -- prognoza na każdy okres to wartość z odpowiedniego miesiąca przeszłego roku

forecast.snaive <- snaive(y, h=24)
forecast.snaive
plot(forecast.snaive)


#Prognoza na podstawie średniej kroczącej

forecast.meanf <- meanf(y, 24)
forecast.meanf
plot(forecast.meanf)


#Prognoza naiwna z trendem
forecast.rwf <- rwf(y, h=24, drift=TRUE)
forecast.rwf
plot(forecast.rwf)
forecast.rwfl <- rwf(y, h=24,, drift=TRUE, lambda=0) # i z transformacją Boxa-Coxa (logarytm)
forecast.rwfl
plot(forecast.rwfl)

# Reszty prognoz i ich autokorelacje

tsdisplay(residuals(forecast.naive))
tsdisplay(residuals(forecast.snaive))
tsdisplay(residuals(forecast.meanf))
tsdisplay(residuals(forecast.rwf))
tsdisplay(residuals(forecast.rwfl))




# Błędy prognoz
crit <- c("MAE", "RMSE", "MAPE")
errors.naive <- accuracy(forecast.naive, z)[,crit]
errors.snaive <- accuracy(forecast.naive, z)[, crit]
errors.meanf <- accuracy(forecast.meanf, z)[, crit]
errors.rwf <- accuracy(forecast.rwf, z)[, crit]
errors.rwfl <- accuracy(forecast.rwfl, z)[, crit]
errors.naive
errors.snaive
errors.meanf
errors.rwf
errors.rwfl



## Eliminacja trendu liniowego

tt <- 1:((length(y)))
tt1 <- (length(y)+1):(length(y)+24)
trend.lin <- lm(y~tt)
resid.lin <- residuals(trend.lin)
summary(trend.lin)
trend.lin.fitted <- ts(data = fitted(trend.lin), start=start(y), end=end(y), frequency=frequency(y))
plot(y)
lines(trend.lin.fitted, col="blue")


#Tworzymy prognozę z modelu liniowego uzupełnioną o sezonową prognozę naiwną.
forecast.lin <- predict.lm(trend.lin, newdata = data.frame(tt=tt1)) #prognoza trendu
forecast.lin <- forecast.lin + snaive(resid.lin, h=24)$mean  #uzupełniamy o reszty
forecast.lin <- ts(forecast.lin, start=c(1959, 1), frequency = 12) #tworzymy serię danych
forecast.lin



## Eliminacja trendu wykładniczego

trend.exp <- lm(log(y)~tt)
resid.exp <- residuals(trend.exp)
summary(trend.exp)
trend.exp.fitted <- ts(data = fitted(trend.exp), start=start(y), end=end(y), frequency=frequency(y))
plot(y)
lines(exp(trend.exp.fitted), col="blue")


#Tworzymy prognozę z modelu trendu wykładniczego uzupełnioną o sezonową prognozę naiwną.


forecast.exp <- predict.lm(trend.exp, newdata = data.frame(tt=tt1)) #prognoza trendu
forecast.exp <- forecast.exp + snaive(resid.exp, h=24)$mean  #uzupełniamy o reszty
forecast.exp <- exp(forecast.exp)
forecast.exp <- ts(forecast.exp, start=c(1960, 1), frequency = 12) #tworzymy serię danych
forecast.exp


#Błędy prognoz
e.forecast.lin <- forecast.lin - z
e.forecast.exp <- forecast.exp - z
v.forecast.lin <- e.forecast.lin/forecast.lin * 100
v.forecast.exp <- e.forecast.exp/forecast.exp * 100


#Ocena błędów
MAE.forecast.lin <- sum(abs(e.forecast.lin))/24
MAE.forecast.exp <- sum(abs(e.forecast.exp))/24
MSE.forecast.lin <- sum((e.forecast.lin)^2)/24
MSE.forecast.exp <- sum((e.forecast.exp)^2)/24
RMSE.forecast.lin <- sqrt(MSE.forecast.lin)
RMSE.forecast.exp <- sqrt(MSE.forecast.exp)
MAPE.forecast.exp <-  sqrt(MSE.forecast.exp)
MAPE.forecast.lin <- sum(abs(v.forecast.lin))/24
MAPE.forecast.exp <- sum(abs(v.forecast.exp))/24
errors.lin <- c(MAE.forecast.lin, RMSE.forecast.lin, MAPE.forecast.lin)
errors.exp <- c(MAE.forecast.exp, RMSE.forecast.exp, MAPE.forecast.exp)
names(errors.lin) <- crit
names(errors.exp) <- crit
errors.lin
errors.exp


## Modele wygładzania wykładniczego

#Proste wygładzanie wykładnicze
forecast.ses <- ses(y, h=24)  #parametr alpha dobierany jest automatycznie
plot(forecast.ses)




#Model Holta (z trendem)
forecast.holt <- holt(y, h=24)  
plot(forecast.holt)



#Model Holta-Wintersa (trend i sezonowość)
forecast.hw <- hw(y, h=24, seasonal="multiplicative")  #sezonowość multiplikatywna
plot(forecast.hw)


errors.ses <- accuracy(forecast.ses, z)[,crit]
errors.holt <- accuracy(forecast.holt, z)[,crit]
errors.hw <- accuracy(forecast.hw, z)[,crit]



## Modele SARIMA

tsdisplay(y)

# Na pewno występuje sezonowość (o okresie 12)
# Trend jest wykładniczy (co wynika z wykresu). Zmienimy go na trend liniowy stosując transformację Boxa-Coxa z $\lambda=0$ (logarytmowanie)

ly <- BoxCox(y, lambda=0)
tsdisplay(ly)

# Aby usunąć sezonowość wykonujemy różnicowanie rzędu 12

ly12 <- diff(ly, lag=12)
tsdisplay(ly12)

# Testy stacjonarności
library(tseries)
adf.test(ly12)  # test Dickeya-Fullera
kpss.test(ly12) # test KPSS

# Testy wskazują na występowanie pierwiastka jednostkowego (choć w przypadku KPSS przy poziomie istotności 10%)
# Aby go usunąć wykonujemy różnicowanie rzędu 1


ly121 <- diff(ly12, lag=1)
tsdisplay(ly121)


# Ponownie wykonujemy test pierwiastka jednostkowego (tym razem dla przyrostów)


adf.test(ly121)  # test Dickeya-Fullera
kpss.test(ly121) # test KPSS


# Wskazują na stacjonarność procesu (choć KPSS znowu niejednoznaczny).

acf(ly121)

# Funkcje autokorelacji i autokorelacji cząstkowej wskazują na modele MA(2), AR(2) lub ARMA(2,2).

ar2 <- Arima(ly121, order=c(2,0,0))
ma2 <- Arima(ly121, order=c(0,0,2))
arma22 <- Arima(ly121, order=c(2,0,2))
ar2
ma2
arma22


#Na podstawie kryteriów informacyjnych (AIC, BIC) należałoby wybrać model ARMA(2,2). Wykonujemy jeszcze testy dla reszt modelu.

tsdisplay(residuals(arma22))
```

## Automatyczny dobór modelu SARIMA

# Zaczynamy od danych wyjściowych
# Przeprowadzamy logarytmowanie (transformacja Boxa-Coxa z parametrem lambda=0) i pozwalamy na dodanie trendu liniowego. Maksymalny rząd opóźnień to 5, a dla opóźnień sezonowych -- 2 
# Model jest wybierany według kryterium BIC 


sarima <- auto.arima(y, max.p=5, max.q=5, max.P=2, max.Q=2, ic="bic", lambda = 0)
sarima

# Badamy reszty:

res <- resid(sarima)
tsdisplay(res)


# Test Ljunga-Boxa na występowanie autokorelacji
Box.test(res, type="Ljung-Box")


#Nie ma podstaw do odrzucenia hipotezy o braku autokorelacji


# Diagnostyka reszt
tsdiag(sarima)


# Wykres kwantyl-kwantyl dla reszt

qqnorm(res)
qqline(res)


# Reszty wydają się mieć rozkład normalny

forecast.sarima <- forecast(sarima, h=24)
errors.sarima <- accuracy(forecast.sarima, z)[, crit]


# Zbieramy wszystkie oszacowania błędów ex-ante

models <- c("naive", "snaive", "meanf", "rwf", "rwfl",  "lin", "exp", "ses", "holt", "hw", "sarima")
assesment <- matrix(0, ncol = length(crit), nrow = length(models))
assesment[1, ] <- errors.naive[2,]
assesment[2, ] <- errors.snaive[2,]
assesment[3, ] <- errors.meanf[2,]
assesment[4, ] <- errors.rwf[2,]
assesment[5, ] <- errors.rwfl[2,]
assesment[6, ] <- errors.lin
assesment[7, ] <- errors.exp
assesment[8, ] <- errors.ses[2,]
assesment[9, ] <- errors.holt[2,]
assesment[10, ] <- errors.hw[2,]
assesment[11, ] <- errors.sarima[2,]
rownames(assesment) <- models
colnames(assesment) <- crit
assesment


# Do prognozy wybieramy zatem model wygładzania Holta-Wintersa oraz model SARIMA(0,1,1)(0,1,1)_{12} z szeregiem zlogarytmowanym (\lambda=0).

# Prognoza na rok 1961 z modelu Holta Wintersa.

forecast1.hw <- hw(x, h = 12, seasonal = "multiplicative") 
forecast1.hw
plot(forecast1.hw)

# Prognoza z modelu SARIMA

sarima1 <- auto.arima(x, max.p = 5, max.q = 5, max.P = 2, max.Q = 2, ic = "bic", lambda = 0)
forecast1.sarima <- forecast(sarima1, h = 12)
forecast1.sarima
plot(forecast1.sarima)


# Różnice procentowe między tymi dwiema prognozami:

100 * (forecast1.sarima$mean - forecast1.hw$mean)/forecast1.sarima$mean
100 * (forecast1.sarima$mean - forecast1.hw$mean)/forecast1.hw$mean
cat("Srednia procentowa różnica prognoz: ",  sum(100 * (forecast1.sarima$mean - forecast1.hw$mean)/forecast1.sarima$mean)/12, ", ", sum(100 * (forecast1.sarima$mean - forecast1.hw$mean)/forecast1.hw$mean)/12, "\n")
