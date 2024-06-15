/*zadanie 1a*/
proc optmodel;
num m=3;
num n=6;
num c{j in 1..n}=[2 4 5 0 1 2];
num b{i in 1..m}=[100 120 100];
num A{i in 1..m, j in 1..n}=[
2 1 1 0 0 0
0 1 0 2 1 0
0 0 1 1 2 3
];
var x{j in 1..n} >=0 integer;
min odpad=sum{j in 1..n}c[j]*x[j];
con war{i in 1..m}: sum{j in 1..n}A[i,j]*x[j]>=b[i];
solve;
print x;
quit;

/*zadanie 2a*/
proc optmodel;
num m=3;
num n=6;
num duzeW=20;
num w{i in 1..m}=[9 7 6];
num b{i in 1..m}=[100 120 100];
num A{i in 1..m, j in 1..n}=[
2 1 1 0 0 0
0 1 0 2 1 0
0 0 1 1 2 3
];
var x{j in 1..n} >=0 integer;
min odpad=duzeW*sum{j in 1..n}x[j]
-sum{i in 1..m}w[i]*b[i];
con war{i in 1..m}: sum{j in 1..n}A[i,j]*x[j]>=b[i];
solve;
print x;
quit;