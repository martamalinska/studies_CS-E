/*przydział zadanie 2a*/
proc optmodel;
num n = 15;
num t{i in 1..n, j in 1..n}=[
20	7	3	10	17	18	11	5	17	16	2	7	15	19	2
8	18	15	18	13	11	16	13	18	5	17	4	15	13	20
11	10	19	17	10	8	16	3	11	15	13	6	14	8	1
19	3	4	3	12	4	15	10	1	13	10	5	17	18	17
19	3	14	15	12	2	11	11	4	16	13	11	6	16	2
11	12	19	7	8	2	2	7	5	10	15	19	3	13	8
18	10	1	7	7	4	7	11	8	19	5	10	10	16	2
9	12	8	15	3	4	19	4	3	2	3	1	4	19	8
15	5	8	3	9	19	18	2	6	3	3	5	7	15	18
13	16	5	14	10	9	5	5	4	9	11	11	3	3	19
18	11	6	19	16	6	10	7	13	10	5	13	12	6	15
19	10	3	4	7	7	2	10	5	6	18	14	1	4	15
16	12	1	8	5	13	6	19	3	19	9	16	7	19	18
13	8	11	3	6	15	5	1	4	3	13	15	2	9	3
13	9	1	6	20	14	11	7	14	10	6	3	2	10	6
];
var x{i in 1..n, j in 1..n} binary;
var czasPr{i in 1..n};
min czas = sum{i in 1..n}czasPr[i];
con pracownik1zadanie{i in 1..n}:
sum{j in 1..n}x[i,j]=1;
con zadanie1pracownik{j in 1..n}:
sum{i in 1..n}x[i,j]=1;
con defCzasu{i in 1..n}:
czasPr[i]=sum{j in 1..n}t[i,j]*x[i,j];
solve;
print x czasPr;
quit;

/*przydział zadanie 2b*/
proc optmodel;
num n = 15;
num t{i in 1..n, j in 1..n}=[
20	7	3	10	17	18	11	5	17	16	2	7	15	19	2
8	18	15	18	13	11	16	13	18	5	17	4	15	13	20
11	10	19	17	10	8	16	3	11	15	13	6	14	8	1
19	3	4	3	12	4	15	10	1	13	10	5	17	18	17
19	3	14	15	12	2	11	11	4	16	13	11	6	16	2
11	12	19	7	8	2	2	7	5	10	15	19	3	13	8
18	10	1	7	7	4	7	11	8	19	5	10	10	16	2
9	12	8	15	3	4	19	4	3	2	3	1	4	19	8
15	5	8	3	9	19	18	2	6	3	3	5	7	15	18
13	16	5	14	10	9	5	5	4	9	11	11	3	3	19
18	11	6	19	16	6	10	7	13	10	5	13	12	6	15
19	10	3	4	7	7	2	10	5	6	18	14	1	4	15
16	12	1	8	5	13	6	19	3	19	9	16	7	19	18
13	8	11	3	6	15	5	1	4	3	13	15	2	9	3
13	9	1	6	20	14	11	7	14	10	6	3	2	10	6
];
var x{i in 1..n, j in 1..n} binary;
var czasPr{i in 1..n};
var y;
min czas = y;
con pracownik1zadanie{i in 1..n}:
sum{j in 1..n}x[i,j]=1;
con zadanie1pracownik{j in 1..n}:
sum{i in 1..n}x[i,j]=1;
con defCzasu{i in 1..n}:
czasPr[i]=sum{j in 1..n}t[i,j]*x[i,j];
con czasMax{i in 1..n}:
czasPr[i] <= y;
solve;
print x czasPr y;
quit;

/*przydział zadanie 2c*/
proc optmodel;
num n = 15;
num t{i in 1..n, j in 1..n}=[
20	7	3	10	17	18	11	5	17	16	2	7	15	19	2
8	18	15	18	13	11	16	13	18	5	17	4	15	13	20
11	10	19	17	10	8	16	3	11	15	13	6	14	8	1
19	3	4	3	12	4	15	10	1	13	10	5	17	18	17
19	3	14	15	12	2	11	11	4	16	13	11	6	16	2
11	12	19	7	8	2	2	7	5	10	15	19	3	13	8
18	10	1	7	7	4	7	11	8	19	5	10	10	16	2
9	12	8	15	3	4	19	4	3	2	3	1	4	19	8
15	5	8	3	9	19	18	2	6	3	3	5	7	15	18
13	16	5	14	10	9	5	5	4	9	11	11	3	3	19
18	11	6	19	16	6	10	7	13	10	5	13	12	6	15
19	10	3	4	7	7	2	10	5	6	18	14	1	4	15
16	12	1	8	5	13	6	19	3	19	9	16	7	19	18
13	8	11	3	6	15	5	1	4	3	13	15	2	9	3
13	9	1	6	20	14	11	7	14	10	6	3	2	10	6
];
var x{i in 1..n, j in 1..n} binary;
var wydPr{i in 1..n};
max wydajnosc = sum{i in 1..n}wydPr[i];
con pracownik1zadanie{i in 1..n}:
sum{j in 1..n}x[i,j]=1;
con zadanie1pracownik{j in 1..n}:
sum{i in 1..n}x[i,j]=1;
con defWydajnosci{i in 1..n}:
wydPr[i]=sum{j in 1..n}1/t[i,j]*x[i,j];
solve;
print x wydPr;
quit;

/*przydział zadanie 2d*/
proc optmodel;
num n = 15;
num t{i in 1..n, j in 1..n}=[
20	7	3	10	17	18	11	5	17	16	2	7	15	19	2
8	18	15	18	13	11	16	13	18	5	17	4	15	13	20
11	10	19	17	10	8	16	3	11	15	13	6	14	8	1
19	3	4	3	12	4	15	10	1	13	10	5	17	18	17
19	3	14	15	12	2	11	11	4	16	13	11	6	16	2
11	12	19	7	8	2	2	7	5	10	15	19	3	13	8
18	10	1	7	7	4	7	11	8	19	5	10	10	16	2
9	12	8	15	3	4	19	4	3	2	3	1	4	19	8
15	5	8	3	9	19	18	2	6	3	3	5	7	15	18
13	16	5	14	10	9	5	5	4	9	11	11	3	3	19
18	11	6	19	16	6	10	7	13	10	5	13	12	6	15
19	10	3	4	7	7	2	10	5	6	18	14	1	4	15
16	12	1	8	5	13	6	19	3	19	9	16	7	19	18
13	8	11	3	6	15	5	1	4	3	13	15	2	9	3
13	9	1	6	20	14	11	7	14	10	6	3	2	10	6
];
var x{i in 1..n, j in 1..n} binary;
var wydPr{i in 1..n};
var y;
max wydajnosc = y;
con pracownik1zadanie{i in 1..n}:
sum{j in 1..n}x[i,j]=1;
con zadanie1pracownik{j in 1..n}:
sum{i in 1..n}x[i,j]=1;
con defWydajnosci{i in 1..n}:
wydPr[i]=sum{j in 1..n}1/t[i,j]*x[i,j];
con wydMin{i in 1..n}:
wydPr[i] >= y;
solve;
print x wydPr y;
quit;