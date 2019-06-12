proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\���׺�_������Ȳ_20190521140700.xlsx';
 *getnames = yes;
run;

proc print data=aaa; run;

data a;
 set aaa;
 drop _col1;
 if substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' or substr(_col0,7,8) = '03' or substr(_col0,7,8) = '04' or substr(_col0,7,8) = '05' or substr(_col0,7,8) = '06'  then qtr=1 ;
 else if substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' or substr(_col0,7,8) = '09' or substr(_col0,7,8) = '10' or substr(_col0,7,8) = '11' or substr(_col0,7,8) = '12' then qtr=2 ;
run;

  proc ttest data=a;
  var _col2;
  class qtr;
  run;

  data a1;
 set aaa;
 drop _col1;
 if substr(_col0,7,8) = '03' or substr(_col0,7,8) = '04' or substr(_col0,7,8) = '05' or substr(_col0,7,8) = '09' or substr(_col0,7,8) = '10' or substr(_col0,7,8) = '11'  then qtr=1 ;
 else if substr(_col0,7,8) = '12' or substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' or substr(_col0,7,8) = '06' or substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' then qtr=2 ;
run;

  proc ttest data=a1;
  var _col2;
  class qtr;
  run;


    data a2;
 set aaa;
 drop _col1;
 if substr(_col0,7,8) = '03' or substr(_col0,7,8) = '04' or substr(_col0,7,8) = '05' then qtr=1 ;
 else if substr(_col0,7,8) = '06' or substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' then qtr=2 ;
run;

  proc ttest data=a2;
  var _col2;
  class qtr;
  run;

data a3;
 set aaa;
 drop _col1;
 if substr(_col0,7,8) = '09' or substr(_col0,7,8) = '10' or substr(_col0,7,8) = '11' then qtr=1 ;
 else if substr(_col0,7,8) = '12' or substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' then qtr=2 ;
run;

  proc ttest data=a3;
  var _col2;
  class qtr;
  run;

  data a4;
 set aaa;
 drop _col1;
 if substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' or substr(_col0,7,8) = '12' then qtr=1 ;
 else if substr(_col0,7,8) = '06' or substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' then qtr=2 ;
run;

  proc ttest data=a4;
  var _col2;
  class qtr;
  run;

  ************************************;

  proc import out=work.aaa1
 dbms = excel replace 
 datafile = 'D:\���׺�_������Ȳ_20190521144012.xlsx';
 *getnames = yes;
run;

data aa1;
 set aaa1;
 drop _col1;
 if substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' or substr(_col0,7,8) = '03' or substr(_col0,7,8) = '04' or substr(_col0,7,8) = '05' or substr(_col0,7,8) = '06'  then qtr=1 ;
 else if substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' or substr(_col0,7,8) = '09' or substr(_col0,7,8) = '10' or substr(_col0,7,8) = '11' or substr(_col0,7,8) = '12' then qtr=2 ;
run;


  ods output ttest=ttest;

  proc ttest data=aa1;
  var _col2;
  class qtr;
  run;


  proc contents data =ttest varnum; run;

data aa2;
 set aaa1;
 drop _col1;
 if substr(_col0,7,8) = '03' or substr(_col0,7,8) = '04' or substr(_col0,7,8) = '05' then qtr=1 ;
 else if substr(_col0,7,8) = '06' or substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' then qtr=2 ;
run;

  proc ttest data=aa2;
  var _col2;
  class qtr;
  run;

data aa3;
 set aaa1;
 drop _col1;
 if substr(_col0,7,8) = '09' or substr(_col0,7,8) = '10' or substr(_col0,7,8) = '11' then qtr=1 ;
 else if substr(_col0,7,8) = '12' or substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' then qtr=2 ;run;

  proc ttest data=aa3;
  var _col2;
  class qtr;
  run;

data aa4;
 set aaa1;
 drop _col1;
 if substr(_col0,7,8) = '01' or substr(_col0,7,8) = '02' or substr(_col0,7,8) = '12' then qtr=1 ;
 else if substr(_col0,7,8) = '06' or substr(_col0,7,8) = '07' or substr(_col0,7,8) = '08' then qtr=2 ;
run;

  proc ttest data=aa4;
  var _col2;
  class qtr;
  run;

  /*
���: ù��°��, �װ������� �̿� ������ ���� 1~6���� 7~12���� ��������� ���̰� ����,
  		�ι�°�δ� �װ������� �̿� ������ ���� �л����� �б⿡ ���� �޶��� ���̶�� ����������, ���̰� ������.(1,2�б� ���� ���� ����)
		����°�� �װ������� �̿� ������ ���� �������бⰣ�� �ܿ���бⰣ�� ���̰� �ִ��� ����������, ���̰� ������.
	(��ü���װ� ��õ�������� ���� ����������, ����� ������)
��, �װ������� �̿� ������ ���� ��� ��� ���̰� ���ٰ� �� �� �ִ�.
  */

proc import out=work.aaa
 dbms = excel replace 
 datafile = 'D:\���׺�_������Ȳ_20190521140700.xlsx';
 *getnames = yes;
run;

  data a;
 set aaa;
 date=substr(_col0, 3,4);
 year=input(date,8.);
 drop _col1 date _col0;
run;

data a_14 a_15 a_16 a_17 a_18 ;
 set a;
 if year = 14 then output  a_14 ;
else if year = 15 then output  a_15 ;
else if year = 16 then output  a_16 ;
else if year = 17 then output  a_17 ;
else if year = 18 then output  a_18 ;
run;

data a_14_18;
 set a_14 a_18;
 run;

proc ttest data=a_14_18;
  var _col2;
  class year;
  run;

  data a_14_17;
 set a_14 a_17;
 run;

proc ttest data=a_14_17;
  var _col2;
  class year;
  run;

  data a_14_16;
 set a_14 a_16;
 run;

proc ttest data=a_14_16;
  var _col2;
  class year;
  run;

  data a_14_15;
 set a_14 a_15;
 run;

proc ttest data=a_14_15;
  var _col2;
  class year;
  run;
***;

  data a_15_16;
 set a_15 a_16;
 run;

proc ttest data=a_15_16;
  var _col2;
  class year;
  run;

    data a_15_17;
 set a_15 a_17;
 run;

proc ttest data=a_15_17;
  var _col2;
  class year;
  run;

    data a_15_18;
 set a_15 a_18;
 run;

proc ttest data=a_15_18;
  var _col2;
  class year;
  run;

**;

    data a_16_17;
 set a_16 a_17;
 run;

proc ttest data=a_16_17;
  var _col2;
  class year;
  run;

     data a_16_18;
 set a_16 a_18;
 run;

proc ttest data=a_16_18;
  var _col2;
  class year;
  run;

  **;
     data a_17_18;
 set a_17 a_18;
 run;

proc ttest data=a_17_18;
  var _col2;
  class year;
  run;

proc univariate data=aaa; run;

  /*
���: �̹����� 14~18�⵵�� ������ ��� ���� ������ �ǽ���.
		14�⵵���� 18�⵵���� ������ ��� �⵵���� �͹������� �Ⱒ�Ǿ� ��� ���̰� ������.
��, ������ �������鼭 �װ������⸦ �̿��ϴ� �̿밴�� ���� �ð� ����.
  */
