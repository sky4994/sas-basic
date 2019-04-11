proc import out = work.a
dbms = excel
datafile = 'D:\sas\2. index 실습.xlsx';
run;

data a1 a2 a3 a4 a5 a6 a7;
set a;
 if index(_COL9, '서울') then output a1;
 else if index(_COL9, '인천') then output a2;
 else if index(_COL9, '경기') then output a3;
 else if index(_COL9, '광주') then output a4;
 else if index(_COL9, '대전') then output a5;
 else if index(_COL9, '대구') then output a6;
 else if index(_COL9, '부산') then output a7;
run;

proc import out = work.h1
dbms = excel
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet = '2$';
run;

proc import out = work.h2
dbms = excel
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet = '3$';
run;

proc import out = work.h3
dbms = excel
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet = '4$';
run;

proc sort data= h1 out = hh1; by id; run;
proc sort data= h2 out = hh2; by id; run;
proc sort data= h3 out = hh3; by id; run;

data aaa;
merge hh1 hh2 hh3;
by id;
run;

data k1;
 set aaa;
run;

proc freq data=k1;
	table dept;
run;

data k1;
set aaa;
id1=substr(id,1,4);
run;

proc freq data=k1;
	table dept*id1;
run;


data k1;
set aaa;
id2=substr(id,3,2);
run;

proc freq data=k1;
	table dept*id2;
run;



proc import out = work.m1
dbms= excel
datafile= 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet='1$';
run;

proc import out = work.m2
dbms= excel
datafile= 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet='2$';
run;

data m11;
set m1;
 *id=_col2;
 *drop _col2;
 rename _col2=id;  *label은 그대로 아이디, 그러나 col name은 _col2에서 id로 변경됨.;
run;

proc sort data=m11 out=mm1; by id; run;
proc sort data=m2 out=mm2; by id; run;

proc contents data=k1; run;

proc means data=k1; var first second third; run;

proc means data=k1; 
var first second third; *숫자 변수(평균을 구하고 싶은 변수);
class id2 ; *문자 변수 (항목별로 보고 싶은 변수);
run;

proc univariate data=k1;
var first second;
class id2;
run;

proc corr data=k1;
 var first second;
 run;
