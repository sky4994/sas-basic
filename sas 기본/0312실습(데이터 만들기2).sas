data Review; *work.Review���� work. �� �����ϰ� �ִ� ����.;
input order value @@;
cards;
 1 	-4.0 
 2 	-3.9 
 3 	-3.8 
 4 	-3.7 
 5 	-3.6 
 6 	-3.5 
 7 	-3.4 
 8 	-3.3 
 9 	-3.2 
 10 	-3.1 
;
run;

*sas���� ���ڿ��� ��������, ���ڿ��� ���������� �ڵ����� �̷�����.;

data Review1 ;
 input grade $ sex $ score ; *���ڿ��� ��� �ش� ���ڿ� �ڿ� $�� ����� �ν� �ȴ�.;
 cards ;
 fresh	m	10
fresh	m	9
fresh	m	8
fresh	m	7
fresh	m	6
fresh	m	5
fresh	m	4
fresh	m	3
fresh	m	2
fresh	m	0
;
run;


libname hig 'D:\sas'; 
*work ���� ���̺귯���� hig��� �̸����� ����� �� ��ǻ�� ���� ��Ҹ� �����ؼ� ����Ǵ� ���� ����� ��.;
*���߿� �ٽ� �����Ҷ�, �̺κи� �ٽ� �����ָ� �ش� ������ �ִ� ��� sas�����͸� ���� ����� �� ����.;

data hig.ingyu;
input wow @@;
cards;
1 2 3 4 5  6 6 7 7 8 8 5 3 2 2 4 4 5 63 2 2 4
;
run;

