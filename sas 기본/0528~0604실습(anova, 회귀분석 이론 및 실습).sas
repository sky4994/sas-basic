data b1;
 input x y @@;
 cards;
 10 1 11 1 12 1 13 1 12 1 11 1 10 1
 15 2 16 2 17 2 18 2 17 2 16 2 15 2
 14 3 16 3 18 3 19 3 21 3 11 3 22 3
 ;
 run;
*x=자료, y=그룹(1,2,3);

 proc anova data=b1;
 class y; *class 그룹;
 model x = y; *그룹별로 자료의 차이가 있는가를 표현한 것;
 means y / lsd; *각 집단의 평균과 표준 편차 / lsd 로 테스트하여 그룹화;
 run; quit;


proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS 데이터의 요약.xlsx';
 sheet = '관계요약';
 *getnames = yes;
run;

proc transpose data=aaa out=a;
by country;
var cow pig egg;
run;

proc anova data=a; 
class _LABEL_ ;
model col1 = _label_;
means _label_/ lsd alpha=0.01;
run; quit;


********************;
proc import out=work.k1
 dbms = excel replace 
 datafile = 'D:\sas\6. 분산분석.xlsx';
 sheet = '1$';
 *getnames = yes;
run;

proc import out=work.k2
 dbms = excel replace 
 datafile = 'D:\sas\6. 분산분석.xlsx';
 sheet = '2$';
 *getnames = yes;
run;

proc import out=work.k3
 dbms = excel replace 
 datafile = 'D:\sas\6. 분산분석.xlsx';
 sheet = '3$';
 *getnames = yes;
run;

proc import out=work.k4
 dbms = excel replace 
 datafile = 'D:\sas\6. 분산분석.xlsx';
 sheet = '4$';
 *getnames = yes;
run;

data kk;
 set k1 k2 k3 k4;
 run;

 proc anova data=kk;
 class grade;
 model score = grade;
 means grade /lsd alpha = 0.1;
run; quit;

 proc anova data=kk;
 class sex grade;
 model score = sex grade;
 means sex grade /lsd alpha = 0.1;
run; quit;

*분산분석 끝;

**************회귀분석 시작;
/*
5/30 통소 회귀분석 이론

선형함수=> Yhat = a + b*X
(=회귀분석)
why 선형? -> 나머지는 변수변환으로 선형으로 만들어서 사용할 수 있음.(간편하고)

가장 좋은 기울기와 절편 = *모든 점과의 거리가 가장 가까운 직선* ->그런걸 찾자!
그러나, 완벽히 똑같을수 없음.
=> Y = a + b*X + e(오차)
=> Yhat - Y = e  -> * e를 최소화 하자. * 

1. 추정: 선찾기 (e가 최소인)
2. 검정: 선 쓸꺼임? (검정. -> 확률계산 -> 확률분포 파악 -> p-value)( H0: b=0인가?)
3. 결정계수(R): 선이 얼마나 좋니? (예측력(설명력)이 얼마나 되는가?-> [0 < Rsquare(R^2) < 1]:결정계수(=상관계수^2))

그러면 이제 다중선형회귀분석(->행렬로 표현) & 비선형회귀분석 -> 모델링.. 시작쓰....
GLM, SVM 등등...
*/


************************6/4 통소 회귀분석 실습;

/*
회귀분석의 기본적인 데이터구조: 1:1, 즉 쌍으로 이루어진 데이터.
(=Regression)
분산분석: x(=그룹)이 이산형 변수였다면,
회귀분석: x(=value)는 연속형 변수이다.

					Analysis of Variance (ANOVA)
					ss      df		ms  		F   
model(회귀)  SSR     1		MSR	  MSR/MSE
error(오차)    SSE     7		MSE		
total(전체)    SST      8
						
					   (ssr+sse)/sst=1
R^2(결정계수) = SSR/SST = 1-SSE/SST = 변수를 많이 넣으면  자동으로 증가됨. but, 무조건 넣으면 안됨.
adj R^2(Adjusted R^2: 수정결정계수) = 1-SSE/SST*(N-1)/(N-1-K) ; k=변수 갯수
*/


data b1;
input x y ;
cards; 
10 11
12 13
12 11
10 15
16 17
18 17
16 15
14 16
18 19
; run;

proc reg data=b1;
 model y = x ;
 output out=aaa predicted=yhat lcl=lower ucl=upper;
 run; quit;
 *y=5.08+0.7x    lclm=lcl=하한선, ucl=uclm=상한선;

proc reg data=b1;
 model y = x /noint;
 run; quit;
*y=1.047x;


 symbol1 v=star c=blue ;
 symbol2 v=bat c=red;
proc gplot data=aaa;
 plot y*x yhat*x / overlay;
 run; quit;


proc import out=work.p
datafile = 'C:\Users\Admin\Downloads\3. 예측수준의 결정_실습_계절효과.xlsx'
dbms= xlsx;
sheet = 'sheet2';
*getnames = yes;
run;

data a1;
 set p;
 month = substr(yymm,6,2);
 if month in ('01' '02' '03') then q=1;
 else if month in ('04' '05' '06') then q=2;
else if month in ('07' '08' '09') then q=3;
 else if month in ('10' '11' '12') then q=4;
  run;

  data a2;
  set a1;
   q1=0; q2=0; q3=0;
   if q=1 then q1=1;
   if q=2 then q2=1;
   if q=3 then q3=1;
   run;

proc print data=a2;run;

proc reg data=a2;
 model market = t q1 q2 q3;
 output out = aa p=yhat  lcl=lower ucl=upper;
run;

 symbol1 v=star c=blue l=none;
 symbol2 v=bat c=red l=none;
proc gplot data=aa;
 plot market*t yhat*t / overlay ;
 run; quit;
