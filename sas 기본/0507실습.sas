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

proc corr data=aaa;
	var cow pig egg milk fish corn bread fruit etc;
run;

data aaa1;
 set aaa;
 cow1=cow-10;
 run;

proc univariate data=aaa1;
var cow1;
run;
