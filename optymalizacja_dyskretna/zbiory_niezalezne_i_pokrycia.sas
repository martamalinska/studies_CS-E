/*zbiory niezalezne zad 2 j*/
proc optmodel;
set wierz = {'a', 'b', 'c', 'd', 'e', 'f'};
set kraw = {'ab', 'ac', 'ad', 'bc', 'bf', 'cd', 'ce', 'cf'};
num A{i in wierz,j in kraw} = [
1	1	1	0	0	0	0	0
1	0	0	1	1	0	0	0
0	1	0	1	0	1	1	1
0	0	1	0	0	1	0	0
0	0	0	0	0	0	1	0
0	0	0	0	1	0	0	1
];
var x{i in wierz} binary;
max fc = sum{i in wierz}x[i];
con niezal{j in kraw}:sum{i in wierz}A[i,j]*x[i] <= 1;
solve;
print x;
quit;

/*pokrycie wierzcholkowe*/
proc optmodel;
set wierz = {'a', 'b', 'c', 'd', 'e', 'f'};
set kraw = {'ab', 'ac', 'ad', 'bc', 'bf', 'cd', 'ce', 'cf'};
num A{i in wierz,j in kraw} = [
1	1	1	0	0	0	0	0
1	0	0	1	1	0	0	0
0	1	0	1	0	1	1	1
0	0	1	0	0	1	0	0
0	0	0	0	0	0	1	0
0	0	0	0	1	0	0	1
];
var x{i in wierz} binary;
min fc = sum{i in wierz}x[i];
con niezal{j in kraw}:sum{i in wierz}A[i,j]*x[i] >= 1;
solve;
print x;
quit;