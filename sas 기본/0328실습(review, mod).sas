proc import out = work.a1
dbms=excel replace
datafile = 'D:\sas\2. SAS �������� Ȱ��.xlsx';
sheet = '2$';
run;

proc import out = work.a2
dbms=excel replace
datafile = 'D:\sas\2. SAS �������� Ȱ��.xlsx';
sheet = '3$';
run;

proc import out = work.a3
dbms=excel replace
datafile = 'D:\sas\2. SAS �������� Ȱ��.xlsx';
sheet = '4$';
run;

proc sort data=a1 out = aa1; by id; run;
proc sort data=a2 out = aa2; by id; run;
proc sort data=a3 out = aa3; by id; run;

data b;
merge aa1 aa2 aa3;
by id;
run;

data b;
set b;
id2= substr(id, 1,4);
run;

proc means data=b mean var median max min std; *proc means���� ���ϴ� ���� ���� ������ ù�ٿ� ���� �ȴ�.;
var first; 
run;

proc means data=b clm alpha=0.02; *�ŷڱ��� ���ϴ� ���(98% �����尪 0.05);
var first; 
run;

proc univariate data=b plot;
var first;
run;

proc corr data=b rank;
var first second third;
run;

**�ǽ�!!
*id�� �й� ����;
* no�� Ȧ��= ��(m), ¦�� =��(f);

data b2;
set b;
id3 = substr(id, 3,2);
if mod(NO , 2) =1 then sex ='m' ;
else sex='f' ;
run;

