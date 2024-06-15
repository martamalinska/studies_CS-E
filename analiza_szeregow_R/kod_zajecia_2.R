# macierz - matrix
# tabela - arrey

A <- matrix(1:12, ncol=3)
A
B <- matrix(12:1, ncol=3, byrow= TRUE)
B
C <- matrix(1:12, ncol=3, nrow=6)
C

dim(C)
dim(C) <- c(3, 6)
C



AA <- array(1:20, dim=c(5, 2, 2))
AA


A

rbind(A, c(7, -1, 5))
D <- matrix(10:22, nrow=4)
D
A
cbind(A, D) #sklejanie macierzy
rbind(A, A) #sklejanie w pionie 

A[2,3]
A[2,3] <- -100
A
AA[3,1,2]

A[2,]
A[,1]
AA[2,,1]
AA[2,,]

A[c(1,3),]
A[c(3,1),]
A[2:4,]
A[c(1,3),c(2,3)]

A[-2,]
A[-c(1,3),]

A[c(T, F, T, F),]

A<0
A[A<0]
A[A>4]
A[A<0] <- 0
A
A[A<5] <- A[A<5] +1
A

A[, A[1,]>3]

ind <- matrix(c(1,1,2,1,3,2), byrow=TRUE, ncol=2)
ind
A[ind]



row(A)
col(A)
row(A) == col(A)
A[row(A) == col(A)] <- 0
A


A
A1 <- A[-1,]
A1


diag(1:4)
diag(A)
diag(B)

diag(A) <- c(5,-2,1)
A

A+B
A-B
A*B
A/B
