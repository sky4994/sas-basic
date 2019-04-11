proc import out = work.normal
datafile = 'D:\1. SAS ������ ���� ������.xlsx'
dbms = excel;
sheet = normal;
run;

data a1;
 set normal;
 fx = (1/(sqrt(2*3.14)))*exp(-(value**2)/2);
run;

*if���� Ȱ���� �� �����ϱ�;
proc gplot data = a1;
plot fx*value;
run; quit;

data a2;
	set a1;

	if value < -3 then x=-3;
	else if value > 3 then x=3;
	else x= value;
run;

proc gplot data=a2;
plot fx*x;
run; quit;

*drop�ϴ� �������� ���� ������;
data a2;
	set a1;

	if value < -3 then delete;
	else if value > 3 then delete;
run;

proc gplot data=a2;
plot fx*value;
run; quit;

*keep�ϴ� �������� ���� ��������;
data a2;
	set a1;
	if -3 < value < 3;
   *if abs(value) < 3;
	run;

proc gplot data=a2;
plot fx*value;
run; quit;
