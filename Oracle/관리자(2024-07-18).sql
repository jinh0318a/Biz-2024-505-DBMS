-- tableSpace 생성
-- 이름 : schoolDB
-- datafile : c:/app/data/schoolDB.dbf
-- 초기사이즈 : 1MByte
-- 자동증가 : 1KByte 씩 자동으로 크기 증가
create TABLESPACE schoolDB datafile 'c:/app/data/schoolDB.dbf' size 1m AUTOEXTEND on next 1k;

ALTER SESSION SET "_ORACLE_SCRIPT" = true;
-- schooluser 사용자 생성, 비밀번호 : s1234
-- DBA 권한 부여
CREATE USER schooluser IDENTIFIED BY s1234 DEFAULT TABLESPACE schoolDB;

grant dba to schooluser;
-- schooluser 사용자 접속 프로파일 만들기
-- schooluser 사용자로 접속하여 
-- tbl_student 테이블 생성
-- 학생정보 데이터 import