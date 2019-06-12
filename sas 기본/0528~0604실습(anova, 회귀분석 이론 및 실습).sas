data b1;
 input x y @@;
 cards;
 10 1 11 1 12 1 13 1 12 1 11 1 10 1
 15 2 16 2 17 2 18 2 17 2 16 2 15 2
 14 3 16 3 18 3 19 3 21 3 11 3 22 3
 ;
 run;
*x=�ڷ�, y=�׷�(1,2,3);

 proc anova data=b1;
 class y; *class �׷�;
 model x = y; *�׷캰�� �ڷ��� ���̰� �ִ°��� ǥ���� ��;
 means y / lsd; *�� ������ ��հ� ǥ�� ���� / lsd �� �׽�Ʈ�Ͽ� �׷�ȭ;
 run; quit;


proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS �������� ���.xlsx';
 sheet = '������';
 *getnames = yes;
run;

proc transpose data=aaa out=a;
by country;
var cow pig egg;
run;

proc anova data=a; 
class _LABEL_ ;
model col1 = _label_;
means _label_/ lsd alpha=0.01;
run; quit;


********************;
proc import out=work.k1
 dbms = excel replace 
 datafile = 'D:\sas\6. �л�м�.xlsx';
 sheet = '1$';
 *getnames = yes;
run;

proc import out=work.k2
 dbms = excel replace 
 datafile = 'D:\sas\6. �л�м�.xlsx';
 sheet = '2$';
 *getnames = yes;
run;

proc import out=work.k3
 dbms = excel replace 
 datafile = 'D:\sas\6. �л�м�.xlsx';
 sheet = '3$';
 *getnames = yes;
run;

proc import out=work.k4
 dbms = excel replace 
 datafile = 'D:\sas\6. �л�м�.xlsx';
 sheet = '4$';
 *getnames = yes;
run;

data kk;
 set k1 k2 k3 k4;
 run;

 proc anova data=kk;
 class grade;
 model score = grade;
 means grade /lsd alpha = 0.1;
run; quit;

 proc anova data=kk;
 class sex grade;
 model score = sex grade;
 means sex grade /lsd alpha = 0.1;
run; quit;

*�л�м� ��;

**************ȸ�ͺм� ����;
/*
5/30 ��� ȸ�ͺм� �̷�

�����Լ�=> Yhat = a + b*X
(=ȸ�ͺм�)
why ����? -> �������� ������ȯ���� �������� ���� ����� �� ����.(�����ϰ�)

���� ���� ����� ���� = *��� ������ �Ÿ��� ���� ����� ����* ->�׷��� ã��!
�׷���, �Ϻ��� �Ȱ����� ����.
=> Y = a + b*X + e(����)
=> Yhat - Y = e  -> * e�� �ּ�ȭ ����. * 

1. ����: ��ã�� (e�� �ּ���)
2. ����: �� ������? (����. -> Ȯ����� -> Ȯ������ �ľ� -> p-value)( H0: b=0�ΰ�?)
3. �������(R): ���� �󸶳� ����? (������(�����)�� �󸶳� �Ǵ°�?-> [0 < Rsquare(R^2) < 1]:�������(=������^2))

�׷��� ���� ���߼���ȸ�ͺм�(->��ķ� ǥ��) & ����ȸ�ͺм� -> �𵨸�.. ���۾�....
GLM, SVM ���...
*/


************************6/4 ��� ȸ�ͺм� �ǽ�;

/*
ȸ�ͺм��� �⺻���� �����ͱ���: 1:1, �� ������ �̷���� ������.
(=Regression)
�л�м�: x(=�׷�)�� �̻��� �������ٸ�,
ȸ�ͺм�: x(=value)�� ������ �����̴�.

					Analysis of Variance (ANOVA)
					ss      df		ms  		F   
model(ȸ��)  SSR     1		MSR	  MSR/MSE
error(����)    SSE     7		MSE		
total(��ü)    SST      8
						
					   (ssr+sse)/sst=1
R^2(�������) = SSR/SST = 1-SSE/SST = ������ ���� ������  �ڵ����� ������. but, ������ ������ �ȵ�.
adj R^2(Adjusted R^2: �����������) = 1-SSE/SST*(N-1)/(N-1-K) ; k=���� ����
*/


data b1;
input x y ;
cards; 
10 11
12 13
12 11
10 15
16 17
18 17
16 15
14 16
18 19
; run;

proc reg data=b1;
 model y = x ;
 output out=aaa predicted=yhat lcl=lower ucl=upper;
 run; quit;
 *y=5.08+0.7x    lclm=lcl=���Ѽ�, ucl=uclm=���Ѽ�;

proc reg data=b1;
 model y = x /noint;
 run; quit;
*y=1.047x;


 symbol1 v=star c=blue ;
 symbol2 v=bat c=red;
proc gplot data=aaa;
 plot y*x yhat*x / overlay;
 run; quit;


proc import out=work.p
datafile = 'C:\Users\Admin\Downloads\3. ���������� ����_�ǽ�_����ȿ��.xlsx'
dbms= xlsx;
sheet = 'sheet2';
*getnames = yes;
run;

data a1;
 set p;
 month = substr(yymm,6,2);
 if month in ('01' '02' '03') then q=1;
 else if month in ('04' '05' '06') then q=2;
else if month in ('07' '08' '09') then q=3;
 else if month in ('10' '11' '12') then q=4;
  run;

  data a2;
  set a1;
   q1=0; q2=0; q3=0;
   if q=1 then q1=1;
   if q=2 then q2=1;
   if q=3 then q3=1;
   run;

proc print data=a2;run;

proc reg data=a2;
 model market = t q1 q2 q3;
 output out = aa p=yhat  lcl=lower ucl=upper;
run;

 symbol1 v=star c=blue l=none;
 symbol2 v=bat c=red l=none;
proc gplot data=aa;
 plot market*t yhat*t / overlay ;
 run; quit;
