/*warunki alternatywne zad 1a*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:sum{i in 1..m}y[i]>=3;
solve;
print x y;
quit;

/*warunki alternatywne zad 1b*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:sum{i in 1..m}y[i]=3;
solve;
print x y;
quit;

/*warunki alternatywne zad 1c*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:y[3]<=y[2];
solve;
print x y;
quit;

/*warunki alternatywne zad 1d*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:y[3]+y[4]<=1;
solve;
print x y;
quit;

/*warunki alternatywne zad 1e*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:y[1]+y[3]+y[4]=1;
solve;
print x y;
quit;

/*warunki alternatywne zad 1f*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod:y[1]-y[4]=0;
solve;
print x y;
quit;

/*warunki alternatywne zad 1g*/
proc optmodel;
num MM=1000;
num eps=0.001;
num m=4;
num m1=2;
num n=4;
num A{i in 1..m, j in 1..n}=[
2 3 4 1
1 2 1 4
3 2 1 6
2 2 4 1
];
num b{i in 1..m}=[10 8 5 8];
num c{j in 1..n}=[4 7 3 4];
var x{j in 1..n}>=0;
var y{i in 1..m} binary;
max fc=sum{j in 1..n}c[j]*x[j];
con warL1{i in 1..m1}:
b[i]*(1-y[i])-MM*y[i]+eps <= sum{j in 1..n}A[i,j]*x[j];
con warR1{i in 1..m1}:
sum{j in 1..n}A[i,j]*x[j] <= b[i]*y[i] + MM*(1-y[i]);
con warL2{i in m1+1..m}:
b[i]*y[i]-MM*(1-y[i]) <= sum{j in 1..n}A[i,j]*x[j];
con warR2{i in m1+1..m}: 
sum{j in 1..n}A[i,j]*x[j] <= b[i]*(1-y[i]) + MM*y[i]-eps;
con warDod1:y[1]+y[2]>=1;
con warDod2:y[1]-y[3]>=0;
con warDod3:y[2]-y[3]>=0;
solve;
print x y;
quit;