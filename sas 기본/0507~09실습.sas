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

proc ttest data=aaa h0=10 alpha=0.01;
var cow;
run;
