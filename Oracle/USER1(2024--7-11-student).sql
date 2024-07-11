-- 여기는 Student TableSpace 를 관리하는 user1 화면입니다
/*

tbl_student table
학번 : st_num 문자열(10) PK
이름 : st_name 한글문자열(20) not null
학과 : st_dept 한글문자열(20) not null
학년 : st_grade 숫자
전화번호 : st_tel 문자열 not null

오라클의 문자열 type
CHAR : 고정문자열, 길이가 일정한 문자열 데이터를 저장하기
 CHAR 타입에 순수 숫자형문자열을 저장하면 SELECT 에서 문제를 일으키는 경우가 많다

VARCHAR2 : 순수 영,숫자형 문자열, 가변문자열, 저장하는 문자열이 컬럼의 크기보다 작으면 공백을 제거하여 공간 낭비를 막는 형식

NVARCHAR2 : UTF-8 방식 영, 숫자, 한글 등 2byte 문자열을 효과적으로 저장하기 위한 type

지금 현재의 DBMS 들은 대체로 영문, 한글 문자열을 특별히 구분하지 않고 처리를 한다.
현업에서 사용하는 오라클 DBMS 는 지금도 7,8,9 정도의 버전을 많이 사용한다.

오라클 9이하의 버전에서 문자열의 type VARCHAR2 와 NVARCHAR2 로 명확히 구분을 하는데,
만약 컬럼에 한글이 저장되어 있다면
VARCHAR2 는 문자열의 길이가 6으로 NVARCHAR2 는 문자열의 길이가 3으로 표현된다.

현재 사용하는 21c 버전에서는 한글이나 영문의 문자열 길이를 실제 문자열의 개수로 표현한다,
하지만 9이전 버전은 VARCHAR2 는 byte 크기로 표현하고, NVARCHAR2 는 문자열의 길이로 표현하여 혼란을 준다.
현재 버전에서 VARCHAR2 과 NVARCHAR2를 구분하는 것은 호환성등을 위한 것이다.

DB 버전에 따라 VARCHAR2 는 실제 길이보다 한글 문자열을 절반밖에 저장못하는 경우도 있다.
*/

create table tbl_student(
st_num VARCHAR2(10) PRIMARY KEY,
st_name NVARCHAR2(20) not null,
st_dept NVARCHAR2(20) not null,
st_grade number(6),
st_tel VARCHAR2(20) not null

);

drop table tbl_student;
/*
다음 3개 데이터 추가
2400001 홍길동, 정보통신, 3학년, 010-1111-1111
2400002 성춘향, 법학과, 2학년, 010-2222-2222
2400003 이몽룡, 행정학과, 4학년, 010-3333-3333

*/
/*
insert into 를 실행할때 전체칼럼에 일치하는 데이터를 추가할때
insert 되는 칼럼 리스트를 생략할수 있지만,
이는 데이터 무결성을 해칠수 있는 아주 위험한 코드이다 절대 사용 금지 
-- insert into tbl_studentvalues('2400001', '홍길동', '정보통신', 3, '010-1111-1111');
*/
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values('2400001', '홍길동', '정보통신', 3, '010-1111-1111');
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values('2400002', '성춘향', '법학과', 2, '010-2222-2222');
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values('2400003', '이몽룡', '행정학과', 4, '010-3333-3333');

-- select length(st_name), length(st_dept) from tbl_student;

/*
학생테이블(tbl_student)에서 이몽룡 학생의 전화번호를
010-3333-3333 에서 010-333-3456 으로 변경

update, delete 명령문은 2개이상의 레코드가 변경되지 않도록 실행해야 한다
학생테이블에서 이몽룡 학생의 전화번호를 변경하려면

1.학생테이블에서 이몽룡 학생의 정보를 select 한다
2.변경하고자 하는 학생의 전화번호를 확인하고
3.변경하고자 하는 학생의 학번을 확인한다
4.학번을 기준으로 update, delete 실행한다
*/

-- 첫번째 select 에서 데이터가 없으면
select * from tbl_student WHERE st_name='이몽룡' and st_tel='010-3333-3333';
-- 이름으로 다시한번 select 를 해본다
select * from tbl_student where st_name='이몽룡';
-- stst_name 컬럼은 pk 도 아니고 , unique 컬럼도 아니다.
-- 이러한 일반적인 컬럼을 where 절에 사용하여 update, delete 를 실행하면
-- 데이터 무결성을 보장 할수 없다.

-- update, delete 하고자하는 데이터의 pk 컬럼을 반드시 확인 한 후
-- pk 컬럼을 where 절에 사용하여 실행해야 한다
update tbl_student SET st_tel='010-333-3456' where st_num=(select st_num from tbl_student where st_name='이몽룡' and st_tel='010-3333-3333');


create table tbl_student(
st_num	VARCHAR2(5)		PRIMARY KEY,
st_name	nVARCHAR2(20)	NOT NULL,
st_dept	nVARCHAR2(20)	NOT NULL,
st_grade	NUMBER		,
st_tel	VARCHAR2(20)	NOT NULL,	
st_addr	nVARCHAR2(125)		

);


select * from tbl_student;
select count(*) from tbl_student;

-- 학생데이터 중에서 학과가 국사학 전공인 학생의 리스트
-- 전체 데이터중에서 특정한 조건(WHERE)을 부여하여 리스트의 일부만 출력하는 것을 SELECTION 이라고 한다.
select * from tbl_student where st_dept='국사학과';
-- select * from tbl_student where st_dept like '%국사%';

-- 학생데이터 중에서 학생이름, 전화번호 항목만 출력 이름순으로 정렬
 select st_name, st_tel from tbl_student order by st_name;

