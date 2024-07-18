-- 여기는 root 로 접속한 화면

/* 
SQL 명령의 3가지 종류 

DDL 데이터 정의어
	- DBA 권한 사용자 명령
	- CREATE * : 객체(table, database ...)를 생성하는 명령
	- DROP * :객체를 제거하는 명령

DML 데이터 조작어
	- CRUD(select, insert, update, delete)
    
DCL 데이터 제어어 
	- GRANT, REVOK

TCL 트랜잭션 제어어
	- COMMIT, ROLLBACK, SAVEPOINT
*/
-- schoolDB 라는 Database 생성
create database schoolDB;
-- database 가 잘 생성되었는지 확인
use schooldb;
show databases;
-- schoolUser 라는 새로운 사용자를 생성
-- 비밀번호 s1234 로 설정
create user 'schoolUser'@'localhost' identified by 's1234';
-- schoolUser 사용자에게 schoolDB의 모든 테이블에 대하여 관리자 권한 부여
grant all privileges on schoolDB.* to `schoolUser`@`localhost`;
-- 권한 보기
show grants for `schoolUser`@`localhost`;
-- 권한 해제
revoke all privileges on schooldb.* from `schoolUser`@`localhost`;

-- workbench 홈 화면에 schooluser 의 접속 프로파일 생성


