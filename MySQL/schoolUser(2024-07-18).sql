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

/* 
학생정보, 성적정보, 과목정보 3개의 테이블을 join 하여 
학번 S00001 인 학생의 성적을 출력

학번, 이름, 학과, 학년, 과목코드, 과목명, 점수
*/
select st.st_num, st.st_name, st.st_dept, st.st_grade, sts.sb_code, sts.sb_name, sts.sc_score
from tbl_student st 
join (select * from tbl_score sc join tbl_subject sb on sc.sc_sbcode=sb_code)sts 
on st.st_num=sts.sc_stnum
where st.st_num='S0001';

select st.st_num, st.st_name, st.st_dept, st.st_grade, sb.sb_code, sb.sb_name, sc.sc_score
from tbl_student st 
join tbl_score sc on st.st_num=sc.sc_stnum
join tbl_subject sb on sc.sc_sbcode=sb.sb_code
where st.st_num='S0001';

select st_num, st_name, st_dept, st_grade, sc_sbcode, sb_name, sc_score 
from tbl_student st 
left join tbl_score sc
on st.st_num = sc.sc_stnum
left join tbl_subject sb
on sc.sc_sbcode = sb.sb_code
where st_num='S0001';

-- 학생정보, 성적정보 join하여 학번, 이름, 학과, 학년, 과목코드, 점수 출력
select st.st_num, st.st_name, st.st_dept, st.st_grade, sc.sc_sbcode, sc.sc_score 
from tbl_student st
join tbl_score sc on st.st_num=sc.sc_stnum
where st.st_num='S0001';

select st_num, st_name, st_dept, st_grade, sc_sbcode, sc_score 
from tbl_student, tbl_score
where st_num=sc_stnum and st_num='S0001';

create view view_scores
as 
(select st.st_num as 학번, st.st_name as 이름, st.st_dept as 학과, st.st_grade as 학년, sb.sb_code as 과목코드, sb.sb_name as 과목명, sc.sc_score as 점수
from tbl_student st 
join tbl_score sc on st.st_num=sc.sc_stnum
join tbl_subject sb on sc.sc_sbcode=sb.sb_code);


select * from view_scores where 학번='S0001'; 


/* 
각 학생의 총점을 계산하여 다음과 같이 출력

학번 이름 학과 학년 총점
*/
select st_num as 학번, st_name as 이름, st_dept as 학과, st_grade as 학년, sum(sc_score) as 총점
from tbl_student st
left join tbl_score sc
on st.st_num=sc.sc_stnum
group by st_num, st_name, st_dept , st_grade;

select st_num as 학번, st_name as 이름, st_dept as 학과, st_grade as 학년, sum(sc_score) as 총점, round(avg(sc_score), 2) as 평균
from tbl_student st
left join tbl_score sc
on st.st_num=sc.sc_stnum
group by st_num, st_name, st_dept , st_grade;

-- 위의 SQL 을 응용하여 각 학생의 평균이 60점 이상, 69점 이하인 학생들만 나열 성적순으로 내림차순 정렬
select st_num as 학번, st_name as 이름, st_dept as 학과, st_grade as 학년, sum(sc_score) as 총점, avg(sc_score) as 평균
from tbl_student st
left join tbl_score sc
on st.st_num=sc.sc_stnum
group by st_num, st_name, st_dept , st_grade
having 평균 between 60 and 69
order by 평균 desc;

-- 위 SQL 을 응용하여 학년이 3학년인 학생들의 총점과 평균을 구하고 평균이 60 이상 69 이하인 리스트 출력
select st_num as 학번, st_name as 이름, st_dept as 학과, st_grade as 학년, sum(sc_score) as 총점, avg(sc_score) as 평균
from tbl_student st
left join tbl_score sc
on st.st_num=sc.sc_stnum
where st.st_grade=3
group by st_num, st_name, st_dept , st_grade
having 평균 between 60 and 69;

