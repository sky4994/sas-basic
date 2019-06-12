*정규분포 + 표준정규분포;
data norm;
 input x @@;
 cards;
-3 -2 -1 0 1 2 3 
;
run;

data norm1;
 set norm;
 pdf = round(pdf('normal',x,0,2),0.00001); * 'normal',x, 평균, 표준편차 순;
 cdf = round(cdf('normal',x,0,2),0.00001);
 cdf1 = round(probnorm(x),0.00001);
 /*format pdf comma.5 cdf comma.5 cdf1 comma.5;*/
run;

proc gplot data= norm1;
	plot pdf*x cdf*x/overlay;
run;


*반복문 기초;
data n;
	i = 0 ;
	x = 0 ;
	do i =1 to 10000 ;
	 z = rannor(0) ;  /* random standard normal 에서  뽑아라 /(0)은 의미없음 */
	 x = z*10+10; 	/* N(10,10^2)인 분포 */
	 x1 = normal(0); /* standard normal 에서 뽑아라 */
	 pdf = pdf('normal',x,10,10);
	 cdf = cdf('normal',x,10,10);
	  cdf1 = round(probnorm(x),0.00001);
	output;
	end;
run;

proc gplot data=n;
 plot (pdf cdf)*x/ href=10 VREF=0.5;
 run;

data n1;
 cdf_90 = cdf('normal',1.94,0,1)-cdf('normal',-1.94,0,1);
 cdf_95 = cdf('normal',1.96,0,1)-cdf('normal',-1.96,0,1);
 cdf_99 = cdf('normal',2.57,0,1)-cdf('normal',-2.57,0,1);
 run;

data n2;
 cdf_90 = probnorm(1.94)-probnorm(-1.94);
 cdf_95 = probnorm(1.96)-probnorm(-1.96);
 cdf_99 = probnorm(2.57)-probnorm(-2.57);
 run;

* t-분포;
data n1;
	x = 1 ;
	do i =1 to 100;
	 z = rannor(0) ;  /* random standard normal 에서  뽑아라 /(0)은 의미없음 */
	 normal = pdf('normal',z,0,1); 
	 t10 = pdf('t',z,10);
	 t20 = pdf('t',z,20);

	output;
	end;

proc gplot data=n1;
 plot (normal t10 t20)*z/ overlay;
 run;

 data a;
  a1=  round(probnorm(0.01)-0.5,0.0001);
  a2= cdf('normal',0.01,0,1);
  a3= probt(0.01, 10);   *t 분포도 저렇게 만들수 잇음;
  run;
