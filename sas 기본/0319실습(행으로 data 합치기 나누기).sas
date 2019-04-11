*0319실습;
*0314실습의 review & 코드 줄이기;

***열 단위로 합치기 & 나누기(데이터 수 늘리기);

proc import out = work.a1
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '1$';
run;

proc import out = work.a2
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '2$';
run;

proc import out = work.a3
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '3$';
run;

proc import out = work.a4
datafile = 'D:\1. SAS 구조의 이해 데이터.xlsx'
dbms = excel;
sheet = '4$';
run;

data a_col;
 set a1 - a4;
 run;

data v1 v2 v3 v4;
 set a_col;
if grade= 'fresh' then output v1;
else if grade= 'sopho' then output v2;
else if grade= 'junior' then output v3;
else if grade= 'senior' then output v4;
run;


***행 단위로 합치기 & 나누기 (변수 늘리기);
**   		+ 행으로 합칠 때는 고유번호(key값)를 지정해야 한다.;
**1. 정렬;

proc import out = work.h1
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용.xlsx';
sheet = '2$';
run;

proc import out = work.h2
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용.xlsx';
sheet = '3$';
run;

proc import out = work.h3
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용.xlsx';
sheet = '4$';
run;

proc sort data = h1 out = hh1; by id; run; *sort 시킬때는 원본데이터로 하지 않는게 좋음.;
proc sort data = h2 out = hh2; by id; run;
proc sort data = h3 out = hh3; by id; run;

data hhh;
 merge hh1 hh2 hh3;
 by id;
run;

proc print data=hhh; run;


data hhh1;
 set hhh;
 mean = sum(first, second, third)/3;
 max_mean = (sum(first, second, third) - min(first, second, third))/2;
 min_mean = (sum(first, second, third) - max(first, second, third))/2;
run;

proc sort data = hhh1 out = hhh4; by descending max_mean; run;

 data hhh2;
 set hhh;
 mean = sum(first, second, third)/3;
 max_mean = (sum(first, second, third) - min(first, second, third))/2;
 min_mean = (sum(first, second, third) - max(first, second, third))/2;
 if max_mean < 30 then grade = 'F';
 else if 30 <= max_mean < 40 then grade = 'D +';
 else if 40 <= max_mean < 55 then grade='C +';
 else if 55 <= max_mean < 75 then grade='B +';
 else if max_mean >= 75  then grade='A +';
run; 

proc sort data =hhh2 out = hhh3; by grade; run;
