**5/16 목욜 통계소프트웨어 강의;

proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\sas\3. SAS 데이터의 요약.xlsx';
 sheet = '관계요약';
 *getnames = yes;
run;

***************짝진 2개집단 t-검정;
/*
짝진 표본을 이용하는 이유

센타이어와 한국타이어의 타이어 마모도를 비교할 때, "동일한 조건에서 비교를 해야하기 때문에"
x1 y1
x2 y2
...  ...
*/
*****짝진표본 하는법 1.(그래프는 다름);
data aaa1;
 set aaa;
cow_pig = cow - pig ;
run;

proc ttest data=aaa1;
var cow_pig;
run; 

*****짝진표본 하는법 2. (이게 정석);
proc ttest data=aaa; 
paired cow*pig;
run;

