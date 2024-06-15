#Funkcja tworzaca obiekt (z wektora liczbowego)
wektorlicz <- function(x) {
  attributes(x) <- list(licz=numeric(length(x)))
  class(x) <- "wektorlicz"
  x
}

#Nowa funkcja generyczna
licz <- function(x)
  UseMethod("licz", x)

#I funkcja dla naszej nowej klasy
licz.wektorlicz <- function(x)
  attr(x, "licz")

#Funkcja wypisujaca wektora (wraz ze zliczaniem zmian)
print.wektorlicz <- function(x) {
  cat("Zawartosc:", x, "\n")
  cat("Zmiany:", licz(x))
}

#Redefinicja funkcji podstawieniowej
#Oprocz wpisania odpowiedniej wartosci ma tez
#zwiekszyc liczbe zmian
"[<-.wektorlicz" <- function(x, i, value) {
  y <- as.vector(x)
  y[i] <- value
  attributes(y) <- attributes(x)
  attr(y, "licz")[i] <- attr(y, "licz")[i] + 1
  y
}

#Przyklad
x <- wektorlicz(1:10) #Tworzymy wektor
attr(x, "licz")
licz(x)
x             #Wypisujemy
x[5] <- 15    #Zmiany
x[5] <- 10
x[5] <- 3
x[2] <- 7
x              #Sprawdzamy
