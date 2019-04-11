data a1;
	input age; *age라는 데이터이름을 붙임;
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
*한줄을 끝낸다는 명령어로 세미콜론을 붙임;
run; *cards는 데이터의 시작을 알리는 명령어;

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
	input age age1 ; *na 혹은 .을 입력해도 상관없음;
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
