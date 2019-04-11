*http://support.sas.com/documentation/cdl/en/lrdict/64316/HTML/default/viewer.htm#a000208980.htm;

*�������� ����ǥ;
data bernoulli;
 input x;
 cards;
 0
 1
;
run;

data bernoulli;
	set bernoulli;
 pdf = pdf('bernoulli',x,0.3) ;
 cdf = cdf('bernoulli',x,0.3);
run;

*���׺��� ����ǥ;
data binom;
 input x @@;
 cards;
 0 1 2 3 4 5 6 7 8 9 10
;
run;

data binom;
	set binom;
 pdf = pdf('binom',x,0.2,10);
 cdf = cdf('binom',x,0.2,10);
run;

data binom1;
 binom1 = cdf('binom',8,0.2,10)-cdf('binom',2,0.2,10);
 binom2 = cdf('binom',10,0.2,10)-cdf('binom',3,0.2,10);
 run;


*���Ƽ� ����ǥ;
 data poisson;
 input x @@;
 cards;
 0 1 2 3 4 5 6 7 8 9 10 100
;
run;

data poisson;
 set poisson;
 pdf = pdf('poisson',x,3);
 cdf = cdf('poisson',x,3);
run;

**�������� ������ ����;

*���Ժ��� + ǥ�����Ժ���;
data norm;
 input x @@;
 cards;
-3 -2 -1 0 1 2 3 
;
run;

data norm;
 set norm;
 pdf = pdf('normal',x,0,2); * 'normal',x, ���, ǥ������ ��;
 cdf = cdf('normal',x,0,2);
 cdf1 = probnorm(x);
run;

proc gplot data= norm;
	plot pdf*x cdf*x/overlay;
run;


*�ݺ��� ����;
data n;
	i = 0 ;
	x = 0 ;
	do i =1 to 10 /*by 0.1*/ ;
	 x = x + i ;
	output;
	end;

run;

