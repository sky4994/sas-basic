*��Ģ����(+, -, *, /), ����, ��Ʈ, �α�, �ڿ��α�(���� 10�� �α�), ����;

proc import out= work.aaa1 
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = '1$';
 *getnames = yes;
 run;

data ccc;
	set aaa1;
	plus = score + 10;
	minus = plus - 15;
	division = plus/minus;
	multiply = division*minus;
	square = score** 2;
	root1 = sqrt(score);
	root2 = score ** 0.5;
	log = log(score);  *log=loge=ln=log����;
	log10 = log10(score);
	exp = exp(score);
run;

proc import out= work.normal 
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = 'normal$';
 *getnames = yes;
 run;

 data ccc2;
  set	normal;
 fx = (1/(sqrt(2*3.14)))*exp(-(value**2)/2);
run;

proc gplot data=ccc2;  *�׷����� ������ �׸���;
 plot fx*value;  *y�� * x�� ������;
 run; quit; *�׷����� �׸��ų� ������ �м����� ����� ��� quit�� �������� sas�� �������� �����ʰ� �ѹ� ������ ��������;

