*�ܺ� �����͸� sas�� �������� ����� ���������� �ִ�.;

*�� �� ù��°�δ�, ����� ���� �̿��� ����̴�.
 ����� '����' ���� ������ '������ ��������'�� ������ ��, ������ â���� ���������� �ϴ� �������� Ȯ���ڸ� ����ش�.
 �������� �Ѿ�� �ش� ������(����)�� ��ο� ���� �����͸� �����ϰ�, ok�� ������.
 ���� ȭ�鿡���� � ��Ʈ�� ������ ������ �����ϴ� ���̴�. (�׸��� �ɼǿ��� ù��° ���� ���� ������ �����Ͽ� ������ ������ ���Ѵ�.)
 �������� �Ѿ�� ������ ���̺귯���� ���ϰ� �����ͼ��� �̸��� ������ �ְ� Finish�� �����ָ� �ҷ�������.;

*�������� �ι�° ����� proc import�� Ȱ���� ����̴�.;
proc import out= work.bbb 
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel replace;
 sheet = '1$';
 getnames = yes;
 run;
 *���� ������ �����ݷ� ���� �Է�. 
 �ؿ� ������ 
 dbms�� ������ ���� ����(���� �̸����� �ٽ� �ҷ������� �Ҷ��� replace) + �����ݷ�
 sheet�� � ��Ʈ�� �������� ���� + �����ݷ�
 getnames�� ù��° ���� ���������� ������  ���� + �����ݷ�(yes�� �⺻����)
 ���������� run;

  proc import out= work.normal
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = 'normal$';
* getnames = yes;
 run;

 proc import out= work.aaa1
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = '1$';
* getnames = yes;
 run;

  proc import out= work.aaa2
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = '2$';
* getnames = yes;
 run;

  proc import out= work.aaa3
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = '3$';
* getnames = yes;
 run;

  proc import out= work.aaa4
 datafile = 'C:\Users\Admin\Desktop\1. SAS ������ ���� ������.xlsx'
 dbms = excel ;
 sheet = '4$';
* getnames = yes;
 run;

data ccc;
	set aaa1;
 *set �� Ȱ���ؼ� ���� �����͸� ���ο� ������ ������ �����´�.
 ��, ���⼭ ������ �۾��ص� aaa1�� �ȹٲ�� ccc�� ���� ��������� �ű⼭�� ��ȭ�� �Ͼ;
	keep grade score;
run;

data ccc;
	set aaa1;
	drop sex;
run;

*keep ���� ������ ���� �����ؼ� �������ų�
 drop ���� ���� ���� �����ؼ� �����ų� �� ������.;
