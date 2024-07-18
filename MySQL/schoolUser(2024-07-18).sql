-- schoolUser 로 접속한 화면
-- 학생정보테이블명세의 학생정보 sheet 를 다음 조건으로 완성
-- 학번 : pk, 학생이름, 학과, 전화번호 not null
-- 학생정보테이블명세.학생정보 sheet 를 기준으로 tbl_student 테이블 생성
use schooldb;

create table tbl_student(
st_num	varchar(5) primary key,
st_name	varchar(20)	not NULL,	
st_dept	varchar(20)	not NULL,	
st_grade tinyint,		
st_tel	varchar(20)	not NULL,	
st_addr	varchar(125)		
);

desc tbl_student;

select count(*) from tbl_student;

create table tbl_subject(
	sb_code	varchar(5)		PRIMARY KEY,
	sb_name	varchar(20)	not null,
	sb_prof varchar(20)
);
drop table tbl_score;
select * from tbl_subject;

create table tbl_score(
sc_stnum	varchar(5)	not null	,	
sc_sbcode	varchar(5)	not null	,	
sc_score	int	not null		,
FOREIGN KEY (sc_stnum) REFERENCES tbl_student(st_num) ,
FOREIGN KEY (sc_sbcode) REFERENCES tbl_subject(sb_code) ,
PRIMARY KEY(sc_stnum,sc_sbcode)	
);

select * from tbl_score;
select count(*) from tbl_score;