*������ ��ġ�� & ������  ( �� ���� );
proc import out = work.aa1
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = '1$';
run;

proc import out = work.aa1
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = '1$';
run;

proc import out = work.aa2
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = '2$';
run;

proc import out = work.aa3
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = '3$';
run;

proc import out = work.aa4
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = '4$';
run;


*���������� ������ ��ġ�� & ������;
	*��ġ��;
data aa_col1;
 set aa1 aa2 aa3 aa4;
run;

data aa_col2;
 set aa1 - aa4;
run;

	*������;
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


*��������� ������ ��ġ��(0319�ǽ�);
