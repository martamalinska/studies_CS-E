/*LOKALIZACJA ZAD 1a*/
proc optmodel;
num m=3;
num n=3;
num maxK = 2;
num a{i in 1..m}=[30 30 30];
num b{j in 1..n}=[28 13 12];
num c{i in 1..m, j in 1..n}=[
2 5 8
11 6 5
3 10 7
];
num k{i in 1..m}=[20 14 20];
var x{i in 1..m, j in 1..n} >=0;
var y{i in 1..m} binary;
min koszt
=sum{i in 1..m, j in 1..n}c[i,j]*x[i,j]
+sum{i in 1..m}k[i]*y[i];
con podaz{i in 1..m}: sum{j in 1..n}x[i,j] <= a[i]*y[i];
con popyt{j in 1..n}: sum{i in 1..m}x[i,j] = b[j];
con ogr: sum{i in 1..m}y[i]=2;
solve;
print x y;
quit;

/*LOKALIZACJA ZAD 3a*/
proc optmodel;
set Miasta={'Szczecin', 'Poznań', 'Wrocław', 'Katowice', 'Warszawa'};
num m = 1;
num n=5;
num L{i in Miasta}=[30 40 40 40 50];
num k{i in Miasta}=[4500 4500 4800 4600 6000];
num d{i in Miasta, j in Miasta}=[
0 196 309 467 454
196 0 145 279 279
309 145 0 169 302
467 279 169 0 259
454 279 302 259 0
];
num c=0.2;
var x{i in Miasta, j in Miasta} binary;
var y{i in Miasta} binary;
min koszt
=sum{i in Miasta, j in Miasta}c*d[i,j]*L[i]*x[i,j]
+sum{i in Miasta}k[i]*y[i];
con przejazdZ{i in Miasta}: sum{j in Miasta}x[i,j]=1-y[i];
con przejazdDo{j in Miasta}: sum{i in Miasta}x[i,j]=(n-1)*y[j];
con liczbaCentrow: sum{i in Miasta}y[i] = m;
/*con bezTychSamych{i in Miasta}:x[i,i]=0;*/
solve;
print x y;
quit;