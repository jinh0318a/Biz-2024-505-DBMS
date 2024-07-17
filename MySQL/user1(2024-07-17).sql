-- 여기는 USER1 으로 접속한 화면
use mydb;
select * from tbl_student;

-- S00001, 홍길동, 정보통신, 3, 010-1111-1111, 서울특별시
desc tbl_student;
insert into tbl_student(st_num, st_name, st_dept, st_grade, st_tel, st_addr) 
values('S00001','홍길동','정보통신','3','010-1111-1111','서울특별시');

-- 학번이 S00001 인 학생의 주소를 강원도 원주로 변경
update tbl_student set st_addr='강원도 원주' where st_num='S00001';

-- update tbl_student 
-- set st_name=#{st_name}, st_dept=#{st_dept}, st_grade=#{st_grade}, st_tel=#{st_tel}, st_addr=#{st_addr} 
-- where st_num=#{st_num};