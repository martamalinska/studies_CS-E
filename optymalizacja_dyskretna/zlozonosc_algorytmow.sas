/*ZADANIE PRZYKŁADOWE*/
proc optmodel;
var x1>=0 integer;
var x2>=0 integer;
max funkcja = x1+4*x2;
con war1: x1+3*x2<=10;
con war2: 6*x1+2*x2<=19;
solve;
print x1 x2;
quit;

/*ZADANIE PRZYKŁADOWE - lepiej*/
proc optmodel;
num m =2;
num n =2;
num b{i in 1..m} = [10 19];
num c{j in 1..n} = [1 4];
num A{i in 1..m,j in 1..n}=[
1 3
6 2
];
var x{j in 1..n} >=0 integer;
max funkcja=sum{j in 1..n}c[j]*x[j];
con war{i in 1..m}:sum{j in 1..n}A[i,j]*x[j]<=b[i];
solve;
print x;
quit;

