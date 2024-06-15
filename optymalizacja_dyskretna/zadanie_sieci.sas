/* zadanie 1a*/
proc optmodel;
set Wezly={'a', 'b', 'c', 'd', 'e', 'f'};
set Luki={'ab', 'ac', 'bd', 'be', 'cd', 'ce', 'df', 'ef'};
num c{j in Luki}=[3 2 4 11 7 10 5 4];
num u{j in Luki}=[20 15 18 17 12 15 10 25];
num b{i in Wezly}=[35 0 0 0 0 -35];
num A{i in Wezly, j in Luki}=[
1 1 0 0 0 0 0 0
-1 0 1 1 0 0 0 0
0 -1 0 0 1 1 0 0
0 0 -1 0 -1 0 1 0
0 0 0 -1 0 -1 0 1
0 0 0 0 0 0 -1 -1
];
var x{j in Luki} >=0 <=u[j];
min koszt=sum{j in Luki}c[j]*x[j];
con warunek{i in Wezly}:
sum{j in Luki}A[i,j]*x[j]=b[i];
solve;
print x;
quit;

/*zadanie 4*/
proc optmodel;
set Wezly={'d1', 'd2', 'p1in', 'p2in', 'p1out', 'p2out', 'o1', 'o2', 'o3', 'mag'};
set Luki={'d1_p1in', 'd1_p2in', 'd2_p1in', 'd2_p2in', 'p1in_p1out', 'p2in_p2out', 'p1out_o1', 'p1out_o2','p1out_o3','p1out_mag','p2out_o1','p2out_o2','p2out_o3','p2out_mag'};
num c{j in Luki}=[1 4 3 5 0 0 1 2 8 3 3 7 11 2];
num u{j in Luki}=[40 40 45 45 50 50 18 17 26 24 18 17 26 24];
num b{i in Wezly}=[40 45 0 0 0 0 -18 -17 -26 -24];
num A{i in Wezly, j in Luki}=[
1	1	0	0	0	0	0	0	0	0	0	0	0	0
0	0	1	1	0	0	0	0	0	0	0	0	0	0
-1	0	-1	0	1	0	0	0	0	0	0	0	0	0
0	-1	0	-1	0	1	0	0	0	0	0	0	0	0
0	0	0	0	-1	0	1	1	1	1	0	0	0	0
0	0	0	0	0	-1	0	0	0	0	1	1	1	1
0	0	0	0	0	0	-1	0	0	0	-1	0	0	0
0	0	0	0	0	0	0	-1	0	0	0	-1	0	0
0	0	0	0	0	0	0	0	-1	0	0	0	-1	0
0	0	0	0	0	0	0	0	0	-1	0	0	0	-1
];
var x{j in Luki} >=0 <=u[j];
min koszt=sum{j in Luki}c[j]*x[j];
con warunek{i in Wezly}:
sum{j in Luki}A[i,j]*x[j]=b[i];
solve;
print x;
quit;
/*ZADANIE 2a*/
proc optmodel;
set wezly = {'a', 'b', 'c', 'd', 'e', 'f'};
set luki = {'ab', 'ac', 'bc', 'bd', 'be', 'cd', 'ce', 'de', 'df', 'ef', 'fa'};
num u{j in luki} = [15	10	5	5	7	8	10	4	10	10 150];
num c{j in luki} = [0 0 0 0 0 0 0 0 0 0 -1];
num b{i in wezly} = [0 0 0 0 0 0];
num A{i in wezly, j in luki} = [
1	1	0	0	0	0	0	0	0	0	-1
-1	0	1	1	1	0	0	0	0	0	0
0	-1	-1	0	0	1	1	0	0	0	0
0	0	0	-1	0	-1	0	1	1	0	0
0	0	0	0	-1	0	-1	-1	0	1	0
0	0	0	0	0	0	0	0	-1	-1	1
];
var x{j in luki} >=0 <=u[j];
min koszt=sum{j in luki}c[j]*x[j];
con warunek{i in wezly}:
sum{j in luki}A[i,j]*x[j]=b[i];
solve;
print x;
quit;

/*ZADANIE 3a*/
proc optmodel;
set wezly = {'a', 'b', 'c', 'd'};
set luki = {'ab', 'ac', 'bc', 'bd', 'cd'};
num c{j in luki} = [6	5	-2	5	8];
num b{i in wezly} = [3 -1 -1 -1];
num A{i in wezly, j in luki} = [
1	1	0	0	0
-1	0	1	1	0
0	-1	-1	0	1
0	0	0	-1	-1
];
var x{j in luki} >=0;
min koszt=sum{j in luki}c[j]*x[j];
con warunek{i in wezly}:
sum{j in luki}A[i,j]*x[j]=b[i];
solve;
print x;
print _CON_.name _CON_.dual;
quit;

/*ZADANIE 3b*/
proc optmodel;
set wezly = {'a', 'b', 'c', 'd', 'e', 'f'};
set luki = {'ab', 'ac', 'bc', 'bd', 'ce', 'de', 'df', 'ef'};
num c{j in luki} = [6	5	-2	6	5	-4	3	3];
num b{i in wezly} = [5 -1 -1 -1 -1 -1];
num A{i in wezly, j in luki} = [
1	1	0	0	0	0	0	0
-1	0	1	1	0	0	0	0
0	-1	-1	0	1	0	0	0
0	0	0	-1	0	1	1	0
0	0	0	0	-1	-1	0	1
0	0	0	0	0	0	-1	-1
];
var x{j in luki} >=0;
min koszt=sum{j in luki}c[j]*x[j];
con warunek{i in wezly}:
sum{j in luki}A[i,j]*x[j]=b[i];
solve;
print x;
print _CON_.name _CON_.dual;
quit;
