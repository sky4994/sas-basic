*5/7 통계 소프트웨어 강의;
proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS 데이터의 요약.xlsx';
 sheet = '관계요약';
 *getnames = yes;
run;


/* 
이론

평균의 검정 -> 1개 집단, 2개집단 -> t-test
분산의 검정 -> 3개 이상의 집단 -> ANOVA

data->모형->예측
모형의 기초 = 선형 모형 (이유 : 다른 모형을 변수변환으로 선형으로 만들 수 있음)

																		표현방식
단순회귀분석(변수가 1개인 선형회귀모형)			-> 그래프
다중회귀분석(변수가 2개 이상인 선형회귀모형) -> 행렬

다변량분석


****************************
*/
proc univariate data=aaa;
var cow;
run;

proc corr data=aaa;
	var cow pig egg milk fish corn bread fruit etc;
run;


*5/9 통계 소프트웨어 강의;

/* 
t-통계량 = 정규화에서 모분산이 아니라 표본분산을 넣어서 구한다.
Std Err(=표준오차) = 정규화의 분모, sqrt(분산/표본갯수)

다음시간에 신뢰구간 구하기 배움.
*/

data aaa1;
 set aaa;
 cow1=cow-10;
 run;

proc univariate data=aaa1;
var cow1;
run;

proc ttest data=aaa h0=10 alpha=0.05;    *h0=귀무가설 alpha=유의수준;
var cow;
run;
*********************************단일 표본 t검정 끝;

*5/14 강의;
***두개 표본 t 검정 시작;
/*
x와 y간의 t 검정(x와 y는 독립)
*/

*************1. data step으로 데이터 전처리 및 2개집단 평균 t 검정;
data cow;
 set aaa;
  group = 'cow';
  value= cow;
 keep value group;
run;

data pig;
 set aaa;
   group= 'pig';
    rename pig=value;
 keep pig group;
run;

data aa;
 set cow pig;
 run;

proc ttest data=aa;
var value;
class group;
run;

*************2. proc transpose로 데이터 전처리 및 2개집단 평균 t 검정;

proc transpose data=aaa out=a1;
by country;
 var cow pig;
 run;

proc ttest data=a1; 
var col1;
class _label_;
run;


*************3. 실제 데이터로 연습!;
proc import out=work.kkk
 dbms = csv replace 
 datafile = 'C:\Users\Admin\Downloads\download\통합 문서1.csv';
 *getnames = yes;
run;

data kkk1;
 set kkk;
 if var2 = '전용면적 60㎡이하' | var2 = '전용면적 60㎡초과 85㎡이하';
 run;
 

proc ttest data=kkk1;
 var var5;
 class var2;
 run;
