*����ġ �ٷ�� ��;

proc import out = work.h1
dbms = excel replace
datafile = 'D:\2. SAS �������� Ȱ�� 1.xlsx';
sheet = '2$';
run;

proc import out = work.h2
dbms = excel replace
datafile = 'D:\2. SAS �������� Ȱ�� 1.xlsx';
sheet = '3$';
run;

proc import out = work.h3
dbms = excel replace
datafile = 'D:\2. SAS �������� Ȱ�� 1.xlsx';
sheet = '4$';
run;

proc sort data = h1 out = hh1; by id; run; *sort ��ų���� ���������ͷ� ���� �ʴ°� ����.;
proc sort data = h2 out = hh2; by id; run;
proc sort data = h3 out = hh3; by id; run;

*merge �Ҷ��� �׻� sort�� ���� ���Ѿ� �Ѵ�!;
data f;
 merge hh1 hh2 hh3;
 by id;
 run;

 data f1;
 merge hh1(in=a) hh2(in=b);   	*(in = )�� �ش� ���� ���Ƿ� �������� �κ��� �ο��ϴ� ��;
 by id;
 if a & b;
 run;

data f2;
 merge hh1(in=a1) hh2(in=a2) hh3(in=a3);   	*(in = )�� �ش� ���� ���Ƿ� �������� �κ��� �ο��ϴ� ��;
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
 if dept in ('������/�������');
 run;

 data ff3;
  set f1;
   x=index(dept, '���');  *index ����;
  run;

   data ff3;
  set f1;
   if index(dept, '���');
  run;
