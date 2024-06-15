/*zadanie plecakowe 1a*/
proc optmodel;
num n=20;
num duzeV=100;
num p{i in 1..n}=[
9.9	6.3	8.8	6.3	8	2.5	3.7	6.4	5.9	11.2	6.7	8.5	3.2	9.8	5.2	4	9.7	6.6	7	3.2
];
num v{i in 1..n}=[
9	10	10	6	10	8	11	9	13	9	13	5	10	15	6	7	11	13	6	9
];
num u{i in 1..n}=[
2	3	2	3	3	3	3	4	4	3	2	2	3	4	2	3	3	3	3	3
];
var x{i in 1..n}>=0 <=u[i] integer;
max funkcja = sum{i in 1..n}p[i]*x[i];
con objetosc: sum{i in 1..n}v[i]*x[i]<=duzeV;
solve;
print x;
quit;

/*zadanie plecakowe 3a*/
proc optmodel;
num n=20;
num duzeV=100;
num duzeW=200;
num p{i in 1..n}=[
9.9	6.3	8.8	6.3	8	2.5	3.7	6.4	5.9	11.2	6.7	8.5	3.2	9.8	5.2	4	9.7	6.6	7	3.2
];
num v{i in 1..n}=[
9	10	10	6	10	8	11	9	13	9	13	5	10	15	6	7	11	13	6	9
];
num w{i in 1..n}=[
14	15	15	16	17	23	15	14	22	22	13	18	27	15	20	15	13	14	27	20
];
var x{i in 1..n} binary;
max funkcja = sum{i in 1..n}p[i]*x[i];
con objetosc: sum{i in 1..n}v[i]*x[i]<=duzeV;
con waga: sum{i in 1..n}w[i]*x[i]<=duzeW;
solve;
print x;
quit;