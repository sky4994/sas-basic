*외부 데이터를 sas로 가져오는 방법은 여러가지가 있다.;

*그 중 첫번째로는, 상단의 탭을 이용한 방법이다.
 상단의 '파일' 탭을 눌러서 '데이터 가져오기'를 선택한 후, 열리는 창에서 가져오려고 하는 데이터의 확장자를 골라준다.
 다음으로 넘어가면 해당 데이터(파일)의 경로에 가서 데이터를 선택하고, ok를 누른다.
 다음 화면에서는 어떤 시트를 가져올 것인지 선택하는 탭이다. (그리고 옵션에서 첫번째 행을 변수 명으로 지정하여 가져올 것인지 정한다.)
 다음으로 넘어가면 가져올 라이브러리를 정하고 데이터셋의 이름을 지정해 주고 Finish를 눌러주면 불러와진다.;

*다음으로 두번째 방법은 proc import를 활용한 방법이다.;
proc import out= work.bbb 
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel replace;
 sheet = '1$';
 getnames = yes;
 run;
 *위에 두줄은 세미콜론 없이 입력. 
 밑에 세줄은 
 dbms로 데이터 형식 결정(같은 이름으로 다시 불러오려고 할때만 replace) + 세미콜론
 sheet로 어떤 시트를 가져올지 결정 + 세미콜론
 getnames로 첫번째 행을 변수명으로 정할지  결정 + 세미콜론(yes가 기본값임)
 마지막으로 run;

  proc import out= work.normal
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = 'normal$';
* getnames = yes;
 run;

 proc import out= work.aaa1
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = '1$';
* getnames = yes;
 run;

  proc import out= work.aaa2
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = '2$';
* getnames = yes;
 run;

  proc import out= work.aaa3
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = '3$';
* getnames = yes;
 run;

  proc import out= work.aaa4
 datafile = 'C:\Users\Admin\Desktop\1. SAS 구조의 이해 데이터.xlsx'
 dbms = excel ;
 sheet = '4$';
* getnames = yes;
 run;

data ccc;
	set aaa1;
 *set 을 활용해서 기존 데이터를 새로운 데이터 명으로 가져온다.
 즉, 여기서 마음껏 작업해도 aaa1는 안바뀌고 ccc로 새로 만들어지고 거기서만 변화가 일어남;
	keep grade score;
run;

data ccc;
	set aaa1;
	drop sex;
run;

*keep 으로 가져갈 열을 선택해서 가져가거나
 drop 으로 버릴 열을 선택해서 버리거나 할 수있음.;
