**5/16 ��� ������Ʈ���� ����;

proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS �������� ���.xlsx';
 sheet = '������';
 *getnames = yes;
run;

***************¦�� 2������ t-����;
/*
¦�� ǥ���� �̿��ϴ� ����

��Ÿ�̾�� �ѱ�Ÿ�̾��� Ÿ�̾� ���𵵸� ���� ��, "������ ���ǿ��� �񱳸� �ؾ��ϱ� ������"
x1 y1
x2 y2
...  ...
*/
*****¦��ǥ�� �ϴ¹� 1.(�׷����� �ٸ�);
data aaa1;
 set aaa;
cow_pig = cow - pig ;
run;

proc ttest data=aaa1;
var cow_pig;
run; 

*****¦��ǥ�� �ϴ¹� 2. (�̰� ����);
proc ttest data=aaa; 
paired cow*pig;
run;

