proc import out = a1
	dbms = excel
	datafile = 'D:\sas\3. SAS �������� ���.xlsx';
	sheet  = '��ġ���$';
run;

proc sort data= a1 out= aa1; by id; run;


data aaa1;
 set aa1;
 id1= substr(id, 1,4);
 if mod(no,2)=0 then sex='f';
 else sex='m';
 run;

 proc freq data=aaa1;
 table id1 sex id1*sex;
 run;

 proc corr data=aaa1;
 var first second third;
 run;

 proc summary data=aaa1; *�ڷḦ ����϶�;
  class id1 sex;					*���� ���� ����ʹ�?;
  var first second third;			*���� ������ ���ؼ�?;
  output out = bbb sum=;		*���� ������ٱ�?  sum=, mean= ��� �� ����;
 run;

 proc print data= bbb; run;

 data k;
  input points @@;
  cards;
  54 51 52 58 96 86 44 15 89 54 75 
45 45 44 45 46 46 48 64 88 46 
13 78  31 65 46 68 46 43 78 74 16 
54 78 78 78 7 97  61 85 1 2 5 13 1 3 54  46
;
run;

proc gchart data=k;
 vbar3d points / midpoints= 0 to 100 by 5;
 run;

 proc gchart data=k;
 	hbar points;
 run;

 proc gplot data=aaa1;
	plot first * second;
run; quit;

 proc gplot data=aaa1;
	plot first * third;
run; quit;

proc gplot data=aaa1;
	plot first * id1 second*id1 third*id1/overlay;
run; quit;

proc import out = z1
	dbms = excel
	datafile = 'D:\sas\3. SAS �������� ���.xlsx';
	sheet  = '������$';
	*getnames = yes;
run;

proc gplot data=z1;
	plot (pig egg milk corn bread fruit etc)*cow;
run; quit;

proc sgscatter data=z1;
	matrix  cow pig egg milk corn bread fruit etc;
run; quit;

proc import out=k1
dbms = excel replace
datafile ='D:\sas\û��Ǿ���_�õ�__20190402140435.xlsx';
sheet = '������';
getnames=yes;
run;

data k2;
 set k1;
 run;

proc gplot data=k1;
 	plot _014_1_4*_col0;
 run;

 proc transpose data=k2 out=kk2;
  var _014_1_4 _014_2_4 _014_3_4 _014_4_4
  		_015_1_4 _015_2_4 _015_3_4 _015_4_4
		_016_1_4 _016_2_4 _016_3_4 _016_4_4
		_017_1_4 _017_2_4 _017_3_4 _017_4_4
		_018_1_4 _018_2_4 _018_3_4 _018_4_4;
run;

 proc transpose data=k2 out=kkk2;
run;

symbol i =spline;
proc gplot data=kk2;
	plot (col1-col18)*_NAME_ /overlay;
run; quit;

