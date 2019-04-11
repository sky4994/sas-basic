data Review; *work.Review에서 work. 을 생략하고 있는 것임.;
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

*sas에서 문자열은 좌측정렬, 숫자열은 우측정렬이 자동으로 이뤄진다.;

data Review1 ;
 input grade $ sex $ score ; *문자열의 경우 해당 문자열 뒤에 $를 써줘야 인식 된다.;
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
*work 같은 라이브러리를 hig라는 이름으로 만들고 내 컴퓨터 내에 장소를 지정해서 저장되는 곳을 만들어 둠.;
*나중에 다시 시작할때, 이부분만 다시 돌려주면 해당 폴더에 있는 모든 sas데이터를 보고 사용할 수 있음.;

data hig.ingyu;
input wow @@;
cards;
1 2 3 4 5  6 6 7 7 8 8 5 3 2 2 4 4 5 63 2 2 4
;
run;

