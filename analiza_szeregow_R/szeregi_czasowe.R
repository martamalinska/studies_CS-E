# Podstawowym typem danych do przechowywania szeregów czasowych jest 'ts'
# Szeregi typu 'ts' muszą mieć stałą częstotliwość próbkowania

# Przykładowy (losowy) wektor długości 15:
zz <- sample(30:50, 15)
zz


# Definiujemy szereg czasowy
# Dane są kwartalne. Pierwsza obserwacja to 1 kw. 2009

x <- ts(data = zz, start = c(2009, 1), frequency = 4)

# Jak wygląda szereg?

x

# Innym popularnym typem danych jest 'zoo'
# W zoo można przechowywać obserwacje o niejednorodnych częstotliwościach

library(zoo)
daty <- as.Date("2017-04-15") + c(0, 5, 17, 20, 25)
daty
zz <- c(67, 12, 34, 11, 8)
y <- zoo(zz, daty)
y


# Informacje nt. własności szeregu (pierwsza i ostatnia obserwacja, częstotliwość)

start(x)      
end(x)
frequency(x)

# Inne funkcje:

# odstęp między kolejnymi obserwacjami
deltat(x)

# szereg momentów czasu
time(x)

# pozycja obserwacji w cyklu
cycle(x)

# pobranie podpróbki danych

y <- window(x, end=c(2010, 3))
y

window(x, start=c(2009, 3), end=c(2010, 3))


# Prezentacja graficzna szeregu

# wykres
plot(x)

# autokorelogramy
acf(x)
pacf(x)

# wykres wartosci/wartosci opoznione
lag.plot(x)
lag.plot(x, lags = 5)


# Pewne przydatne pakiety
library(forecast)

# taka grafika
autoplot(x)
tsdisplay(x)
Acf(x)
Pacf(x)


library(TSstudio)

#wykresy interaktywne
ts_plot(x)
ts_cor(x)
ts_decompose(x)


# Dane dostępne w R i w pakietach

data()
x <- AirPassengers
x
tsdisplay(x)


# dane z książki Hyndmana i Athanasopoulosa, Forecasting: Principles and Practice
library(fpp2)
help(fpp2)
data(package="fpp2")
goog   #ceny akcji Google'a
tsdisplay(goog)


# wymiana danych z Excelem

# czytanie z pliku tekstowego (csv)
tmp <- read.table("wymiana.csv", header = TRUE, sep=";", dec=".")

#czytanie ze schowka (należy najpierw zaznaczyć dane do kopiowania w Excelu)
tmp <- read.table("clipboard", header = TRUE, sep="\t", dec=".")

# czytanie bezpośrednio z plików xlsx

library(openxlsx)
tmp <- read.xlsx("szeregi_w_R.xlsx", sheet = "dane", startRow = 3)


#pakiet xlsx (wymagana jest Java)
library(xlsx)
tmp <- read.xlsx("szeregi_w_R.xlsx", sheet = "dane", startRow = 3)


# przekształcenie ramki na obiekt 'ts'
dane <- ts(tmp$Indeks, start = c(1996,1), frequency = 4)
tsdisplay(dane)


#############################################################
############### Przekształcenia szeregów ####################
#############################################################

x <- AirPassengers

# logarytmowanie

y <- log(x)
tsdisplay(x)


# transformacja Boxa-Coxa

y <- BoxCox(x, lambda = .1)
tsdisplay(y)

y <- BoxCox(x, lambda = .5)
tsdisplay(y)

y <- BoxCox(x, lambda = 1.5)
tsdisplay(y)

# transformacja odwrotna

z <- InvBoxCox(y, lambda = 1.5)
z - x


# opóźnienia

lag(x, -1)
lag(x, -5)



# różnicowanie
y <- diff(x)
y

# operacja odwrotna do różnicowania
z <- c(0,cumsum(y))
z

z <- z + 112
z
ts(z, start=c(1949, 1), freq=12)




#############################################################
################### Średnie ruchome #########################
#############################################################

# średnia krocząca rzędu 3

# do obliczania wykorzystywane są tylko wartości z przeszłości
filter(x, filter=c(1/3, 1/3, 1/3), sides=1)

# średnią można też obliczać na podstawie wartości z obu stron
y <- filter(x, filter=c(1/3, 1/3, 1/3), sides=2)

plot(x)
lines(y, col="blue")


# większe wygładzanie
y <- filter(x, filter=rep(1/7, 7), sides=2)

plot(x)
lines(y, col="blue")


# istnieje też funkcja 'ma' z pakietu 'forecast'
ma(x, order=6)
ma(x, order=6, centre = FALSE)


# średnia ważona
filter(x, filter = c(0.2, 0.3, 0.5), sides=1)


# dekompozycja szeregu za pomocą średnich ruchomych

dd <- decompose(x)
dd
dd$trend
plot(dd)


# dekompozycja wykładnicza

dd <- decompose(x, type = "multi")
dd
plot(dd)


#############################################################
###################### Regresja  ############################
#############################################################

# trend liniowy

reg <- lm(x ~ time(x))
reg
summary(reg)
str(reg)

plot(reg)

# jak wyciągnąć wyniki?
reg$coefficients
coef(reg)

# reszty
reg.res <- residuals(reg)
plot(reg.res, type="l")

reg.res <- ts(reg.res, start=start(x), frequency = frequency(x))
plot(reg.res)


# wartości teoretyczne

x.teor <- fitted(reg)
x.teor <- ts(x.teor, start=start(x), frequency = frequency(x))
tsdisplay(x.teor)


# Funkcja 'tslm' z pakietu 'forecast'

reg1 <- tslm(x ~ trend)
reg1
summary(reg1)
x.teor1 <- fitted(reg1)
tsdisplay(x.teor1)

# można zastosować, np. dla trendu kwadratowego
reg2 <- tslm(x ~ I(trend^2))
plot(x)
lines(fitted(reg2), col="blue")


#############################################################
########## Wygładzanie wykładnicze  i prognozowanie #########
#############################################################


# Funkcje dostępne w pakietach 'forecast' i 'TSstudio'

# prognoza naiwna
x.naive <- naive(x, h=10)
x.naive
plot(x.naive)

# jakość prognozy
accuracy(x.naive)

# mozliwe jest takze testowanie metody w podziale na zbior uczący i testowy
# automatyczny podział na zbiór uczący i testowy
train <- ts_split(x)$train
test <- ts_split(x)$test

prog <- naive(train, h = length(test))


# jakość prognozy ex post
accuracy(prog)

# prognozy ex ante
test_forecast(x, prog, test=test)


# proste wygładzanie wykładnicze - wraz z prognozą
x.ses1 <- ses(x, h=10, alpha=0.3)
x.ses1
summary(x.ses1)

plot(x.ses1)

# wartości wygładzone
y <- fitted(x.ses1)
plot(x)
lines(y, col="blue")


# kryteria dopasowania
accuracy(x.ses1)


#optymalizacja parametru alpha
x.ses2 <- ses(x, h=10)
x.ses2
summary(x.ses2)

plot(x.ses2)
accuracy(x.ses2)


y <- fitted(x.ses2)
plot(x)
lines(y, col="blue")


# model Holta
x.holt1 <- holt(x, h=10, alpha=0.5, beta=0.3)
x.holt1
summary(x.holt1)
plot(x.holt1)

# optymalizacja parametrów wygładzania
x.holt2 <- holt(x, h=10)
x.holt2
summary(x.holt2)

plot(x.holt2)


# można też zastosować transformację Boxa-Coxa

# transformacja logarytmiczna
x.holt3 <- holt(x, h=10, lambda = 0)
x.holt3
summary(x.holt3)

plot(x.holt3)


# lambda = 0.7
x.holt4 <- holt(x, h=10, lambda = 0.7)
x.holt4
summary(x.holt4)

plot(x.holt4)