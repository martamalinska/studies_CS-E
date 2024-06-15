Utwórz sekwencję liczb:
  a. od 100 do 199,
seq(100, 199)
b. od 199 do 100,
seq(199, 100)
c. od 0 do 5, w odstępie co 0,1,
seq(0, 5, by = 1)
d. od 0 do 3, sekwencja długości 100,
seq(0, 3, length.out = 100)
e. od 3 do 0, sekwencja długości 100,
seq(3, 0, length.out = 100)
f. sekwencję logarytmów naturalnych liczb od 1 do 20.
f <- log(seq(1, 20))
f

Zadeklaruj zmienne:
  a. x równą 1,
x <- 1
x
b. y równą ln(5),
y <- log(5)
y
c. z równą liczbie pi,
z <- pi
d. aa zawierającą napis „programowanie”,
aa <- "programowanie"
e. x1 oraz x2 równe 1 (zrób to jednym poleceniem),
x1 <- x2 <- 1

Wykonaj następujące polecenia:
  a. sprawdź, jakie zmienne są zdefiniowane w obszarze roboczym,
ls()
b. usuń zmienną z,
rm(z)
c. ponownie sprawdź zdefiniowane zmienne,
ls()
d. sprawdź, czy zmienne x oraz x1 mają takie same wartości,
ls(x)
ls(x1)
e. wydrukuj napis „Zmienna x jest równa xxx, a zmienna aa jest równa xxx”, gdzie zamiast xxx znajdują się wartości tych zmiennych,
f. usuń wszystkie zmienne.
rm(list=ls())

Utwórz wektory
a) (1, 2, 3, …, 20)
x1 <- c(1:20)
x
b) (20, 19, 18, …, 1)
x2 <- c(20:1)
c) (1, 2, …, 19, 20, 19, 18, …, 1)
c(x1, x2)
d) (4, 6, 3, 4, 6, 3, …., 4, 6, 3), gdzie liczba 4 powtarza się 10 razy
rep(c(4, 6, 3), 10)
e) (4, 6, 3, 4, 6, 3, …, 4, 6, 3, 4) gdzie liczba 4 powtarza się 11 razy, a 6 i 3 – 10 razy
rep(c(4, 6, 3, 4), 10)
f) (4, 4, …, 4, 6, 6, …, 6, 3, 3, …, 3), gdzie 4 powtarza się 10 razy, 6 powtarza się 20 razy, a 3 – 30 razy
g) (1, 3, 5, 7, 9, 11, 13, …, 51)