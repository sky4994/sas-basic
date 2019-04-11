proc import out = work.a1
dbms=excel replace
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet = '2$';
run;

proc import out = work.a2
dbms=excel replace
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
sheet = '3$';
run;

proc import out = work.a3
dbms=excel replace
datafile = 'D:\sas\2. SAS 데이터의 활용.xlsx';
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

proc means data=b mean var median max min std; *proc means에서 원하는 값만 빼서 보려면 첫줄에 쓰면 된다.;
var first; 
run;

proc means data=b clm alpha=0.02; *신뢰구간 구하는 방법(98% 디폴드값 0.05);
var first; 
run;

proc univariate data=b plot;
var first;
run;

proc corr data=b rank;
var first second third;
run;

**실습!!
*id로 학번 생성;
* no가 홀수= 남(m), 짝수 =여(f);

data b2;
set b;
id3 = substr(id, 3,2);
if mod(NO , 2) =1 then sex ='m' ;
else sex='f' ;
run;

