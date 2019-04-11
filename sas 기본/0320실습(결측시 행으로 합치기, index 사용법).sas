*결측치 다루는 법;

proc import out = work.h1
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용 1.xlsx';
sheet = '2$';
run;

proc import out = work.h2
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용 1.xlsx';
sheet = '3$';
run;

proc import out = work.h3
dbms = excel replace
datafile = 'D:\2. SAS 데이터의 활용 1.xlsx';
sheet = '4$';
run;

proc sort data = h1 out = hh1; by id; run; *sort 시킬때는 원본데이터로 하지 않는게 좋음.;
proc sort data = h2 out = hh2; by id; run;
proc sort data = h3 out = hh3; by id; run;

*merge 할때는 항상 sort를 먼저 시켜야 한다!;
data f;
 merge hh1 hh2 hh3;
 by id;
 run;

 data f1;
 merge hh1(in=a) hh2(in=b);   	*(in = )은 해당 열에 임의로 공통적인 부분을 부여하는 것;
 by id;
 if a & b;
 run;

data f2;
 merge hh1(in=a1) hh2(in=a2) hh3(in=a3);   	*(in = )은 해당 열에 임의로 공통적인 부분을 부여하는 것;
 by id;
 if a1 & a2 & a3;
 run;

data ff1;
 set f1;
 if no in ('1' '2' '3' '4' '5') then delete;
 run;

data ff2;
 set f1;
 if no not in ('1' '2' '3' '4' '5');
 run;

data ff3;
 set f1;
 if dept in ('경상대학/비즈통계');
 run;

 data ff3;
  set f1;
   x=index(dept, '통계');  *index 사용법;
  run;

   data ff3;
  set f1;
   if index(dept, '통계');
  run;
