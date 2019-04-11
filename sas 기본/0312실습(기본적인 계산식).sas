*사칙연산(+, -, *, /), 제곱, 루트, 로그, 자연로그(밑이 10인 로그), 지수;

proc import out= work.aaa1 
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = '1$';
 *getnames = yes;
 run;

data ccc;
	set aaa1;
	plus = score + 10;
	minus = plus - 15;
	division = plus/minus;
	multiply = division*minus;
	square = score** 2;
	root1 = sqrt(score);
	root2 = score ** 0.5;
	log = log(score);  *log=loge=ln=log지수;
	log10 = log10(score);
	exp = exp(score);
run;

proc import out= work.normal 
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = 'normal$';
 *getnames = yes;
 run;

 data ccc2;
  set	normal;
 fx = (1/(sqrt(2*3.14)))*exp(-(value**2)/2);
run;

proc gplot data=ccc2;  *그래픽한 산점도 그리기;
 plot fx*value;  *y축 * x축 형식임;
 run; quit; *그래프를 그리거나 복잡한 분석툴을 사용할 경우 quit를 사용해줘야 sas가 무한으로 돌지않고 한번 돌리고 빠져나옴;

