*5/7 ��� ����Ʈ���� ����;
proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS �������� ���.xlsx';
 sheet = '������';
 *getnames = yes;
run;


/* 
�̷�

����� ���� -> 1�� ����, 2������ -> t-test
�л��� ���� -> 3�� �̻��� ���� -> ANOVA

data->����->����
������ ���� = ���� ���� (���� : �ٸ� ������ ������ȯ���� �������� ���� �� ����)

																		ǥ�����
�ܼ�ȸ�ͺм�(������ 1���� ����ȸ�͸���)			-> �׷���
����ȸ�ͺм�(������ 2�� �̻��� ����ȸ�͸���) -> ���

�ٺ����м�


****************************
*/
proc univariate data=aaa;
var cow;
run;

proc corr data=aaa;
	var cow pig egg milk fish corn bread fruit etc;
run;


*5/9 ��� ����Ʈ���� ����;

/* 
t-��跮 = ����ȭ���� ��л��� �ƴ϶� ǥ���л��� �־ ���Ѵ�.
Std Err(=ǥ�ؿ���) = ����ȭ�� �и�, sqrt(�л�/ǥ������)

�����ð��� �ŷڱ��� ���ϱ� ���.
*/

data aaa1;
 set aaa;
 cow1=cow-10;
 run;

proc univariate data=aaa1;
var cow1;
run;

proc ttest data=aaa h0=10 alpha=0.05;    *h0=�͹����� alpha=���Ǽ���;
var cow;
run;
*********************************���� ǥ�� t���� ��;

*5/14 ����;
***�ΰ� ǥ�� t ���� ����;
/*
x�� y���� t ����(x�� y�� ����)
*/

*************1. data step���� ������ ��ó�� �� 2������ ��� t ����;
data cow;
 set aaa;
  group = 'cow';
  value= cow;
 keep value group;
run;

data pig;
 set aaa;
   group= 'pig';
    rename pig=value;
 keep pig group;
run;

data aa;
 set cow pig;
 run;

proc ttest data=aa;
var value;
class group;
run;

*************2. proc transpose�� ������ ��ó�� �� 2������ ��� t ����;

proc transpose data=aaa out=a1;
by country;
 var cow pig;
 run;

proc ttest data=a1; 
var col1;
class _label_;
run;


*************3. ���� �����ͷ� ����!;
proc import out=work.kkk
 dbms = csv replace 
 datafile = 'C:\Users\Admin\Downloads\download\���� ����1.csv';
 *getnames = yes;
run;

data kkk1;
 set kkk;
 if var2 = '������� 60������' | var2 = '������� 60���ʰ� 85������';
 run;
 

proc ttest data=kkk1;
 var var5;
 class var2;
 run;
