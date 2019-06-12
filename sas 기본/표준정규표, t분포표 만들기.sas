************************ 표준정규분포 표 만듦.;
data n1;
	do i =0 to 3 by 0.1;
	 do j = 0.00 to 0.09 by 0.01;
	 normal = round(cdf('normal',i+j,0,1)-0.5,0.0001);
	output;
	end;
	end;
run;

proc transpose data=n1 out=n2(drop=_name_);
 *id j;
 var normal;
 by i;
 run;



 ************************ 여긴 t 분포표 ;
data t1;
	do T1 =1 to 20 ;
	 t_025=round(abs(tinv(0.25,T1)),0.001);
	 t_020=round(abs(tinv(0.2,T1)),0.001);
	 t_015=round(abs(tinv(0.15,T1)),0.001);
	 t_010=round(abs(tinv(0.1,T1)),0.001);
	 t_005=round(abs(tinv(0.05,T1)),0.001);
	 t_0025=round(abs(tinv(0.025,T1)),0.001);
	 t_001=round(abs(tinv(0.01,T1)),0.001);
	 t_0005=round(abs(tinv(0.005,T1)),0.001);
	 t_00005=round(abs(tinv(0.0005,T1)),0.001);
	output;
	end;
	
run;

data t1;
 set t1;
  T = put(T1, 8.);
	drop T1 ;
  run;

 data t2;
 set t2;
 	 T='무한대';
	 t_025=round(abs(probit(0.25)),0.001);
	 t_020=round(abs(probit(0.2)),0.001);
	 t_015=round(abs(probit(0.15)),0.001);
	 t_010=round(abs(probit(0.1)),0.001);
	 t_005=round(abs(probit(0.05)),0.001);
	 t_0025=round(abs(probit(0.025)),0.001);
	 t_001=round(abs(probit(0.01)),0.001);
	 t_0005=round(abs(probit(0.005)),0.001);
	 t_00005=round(abs(probit(0.0005)),0.001);
run;

 data t ;
  retain T;
  set t1 t2;
  run;



data aa;
	inv1= probit(0.90);
	inv2= probit(0.95);   *신뢰구간 90%;
	inv3= probit(0.975);	*신뢰구간 95%;
	inv4= probit(0.99);

	inv11=tinv(0.25,20);
run;
