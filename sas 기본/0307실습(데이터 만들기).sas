data a1;
	input age; *age��� �������̸��� ����;
	cards;
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10
	;
*������ �����ٴ� ��ɾ�� �����ݷ��� ����;
run; *cards�� �������� ������ �˸��� ��ɾ�;

data a2;
	input age ;
	cards;
	1	2	3	4	5	6	7	8	9	10
	;
run;

data a4;
	input age age1 ;
	cards;
	1	2	3	4	5	6	7	8	9	10
	;
run;

data a3;
	input age age1 @@;
	cards;
	1	10	2	20	3	30	4	40	5	50
	6	60	7	70	8	80	9	90	10	100
	;
	run;

data a5;
	input age age1 ; *na Ȥ�� .�� �Է��ص� �������;
	cards;
	1	10
	2	20
	3	na
	4	40
	5	50
	6	60
	7	70
	8	80
	9	90
	10	100
	;
	run;
