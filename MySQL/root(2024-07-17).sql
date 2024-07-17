-- root 접속화면
-- MySQL의 데이터 저장소(Schema) 생성하기
create DATABASE mydb;
-- 데이터 저장소 사용승인 받기
use mydb;

/*
MySQL의 데이터 칼럼 type 
문자열 char, varchar 가 있다
char : 고정문자열
varchar : 가변문자열
한, 영 구분없이 같은 type 으로 저장 가능

정수형 tinyint, smallint, mediumint, int, bigint
	  1btye 	2byte  	   3byte   4byte  8byte

실수형 float, double, real

*/
create TABLE tbl_student(
	st_num varchar(6) primary key,
    st_name varchar(20) not null,
    st_dept varchar(20) not null,
    st_grade tinyint not null,
    st_tel varchar(20),
	st_addr varchar(125)
);

-- 시스템에 어떤 데이터베이스가 있는가
show databases;
-- 데이터베이스를 사용하겠다
use mydb;
-- db에 어떤 테이블이 있는가
show tables;
-- 테이블의 구조
describe tbl_student;
desc tbl_student;


-- localhost 에서만 접근 가능한 user1 사용자 생성
create user 'user1'@'localhost' Identified by '12341234';

-- localhost 의 user1 은 mydb 의 모든테이블에 모든 권한을 가진다.
grant all privileges on mydb.* to 'user1'@'localhost';


drop user 'user1'@'localhost';

delete from mysql.user where User ='user1';

delete from mysql.db where User ='user1';

flush privileges;
