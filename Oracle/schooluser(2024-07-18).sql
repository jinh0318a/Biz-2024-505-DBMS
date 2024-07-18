-- schooluser 로 접속

create table tbl_student(
    st_num	varchar2(5)		PRIMARY KEY,
    st_name	nvarchar2(20)	not NULL,	
    st_dept	nvarchar2(20)	not NULL,	
    st_grade	number,
    st_tel	VARCHAR2(20)	not NULL,	
    st_addr	nvarchar2(125)
);

select count(*) from tbl_student;
