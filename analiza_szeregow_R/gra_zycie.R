{
  m <- 10  # liczba wierszy
  n <- 10  # liczba kolumn
  p <-
    0.5   # stan pocz¹tkowy - prawdopodobienstwo wylosowania ,,zywej' komorki
  # inicjalizacja macierzy komorek i jej wyswietlanie
  A <- matrix(sample(c(0, 1), prob = c(p, 1 - p), size = m * n, replace = T), nrow = m, ncol = n)

 #Alternatywna, nielosowa inicjalizacja
 #m <- 50  # liczba wierszy
 #n <- 50  # liczba kolumn
 #A <- matrix(0,   nrow = m,   ncol = n)
 #A[1:3,3] <- A[2,1] <- A[3,2] <- 1 
  
  
 #Alternatywna, nielosowa inicjalizacja -- ,,krokodyl''
 #  m <- 12  # liczba wierszy
 #  n <- 20  # liczba kolumn
 #  A <- matrix(0,   nrow = m,   ncol = n)
 #  A[6:8,8:15]  <- 1 
 #  A[7,c(9,14)] <- 0
  
  
  image(t(A[rev(1:m),]), axes = FALSE, col = grey(c(1, 0)))
  cat ("Nacisnij [enter], aby kontynuowaæ.")
  c <- readline()
  
  #gra
  repeat {
    B <- matrix(0, ncol = n, nrow = m) # macierz z liczba sasiadow
    for (i in 1:m)
      for (j in 1:n)
        B[i, j] <-
          sum(A[max(i - 1, 1):min(i + 1, m), max(j - 1, 1):min(j + 1, n)]) - A[i, j]
      
      C <- matrix(0, ncol = n, nrow = m) # nowa generacja
      ind2 <- B == 2
      ind3 <- B == 3
      C[ind2] <- A[ind2]
      C[ind3] <- 1
      A <- C
      image(t(A[rev(1:m),]), axes = FALSE, col = grey(c(1, 0)))
      cat ("Nacisnij [enter], aby kontynuowaæ. [q/Q] - wyjœcie")
      c <- toupper(readline())
      if (c == "Q")
        break
  }
}



