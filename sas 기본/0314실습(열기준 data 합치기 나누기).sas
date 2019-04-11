*데이터 합치기 & 나누기  ( 열 기준 );
proc import out = work.aa1
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '1$';
run;

proc import out = work.aa1
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '1$';
run;

proc import out = work.aa2
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '2$';
run;

proc import out = work.aa3
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '3$';
run;

proc import out = work.aa4
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '4$';
run;


*열기준으로 데이터 합치기 & 나누기;
	*합치기;
data aa_col1;
 set aa1 aa2 aa3 aa4;
run;

data aa_col2;
 set aa1 - aa4;
run;

	*나누기;
data aa_fresh;
	set aa_col2;
	if grade = 'fresh';
run;
data aa_sopho;
	set aa_col2;
	if grade = 'sopho';
run;
data aa_junior;
	set aa_col2;
	if grade = 'junior';
run;
data aa_senior;
	set aa_col2;
	if grade = 'senior';
run;

data aa_m;
 	set aa_col1;
	if sex = 'm';
	run;

data aa_f;
	set aa_col1;
	if sex = 'f' ;
	run;


*행기준으로 데이터 합치기(0319실습);
