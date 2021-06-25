CREATE DATABASE db_school;
USE db_school;
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL,	
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)		
);

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
sc_stnum	CHAR(8)	NOT NULL,	
sc_sbcode	CHAR(4)	NOT NULL,
sc_score	INT	NOT NULL	
);

drop TABLE tbl_subject;
CREATE TABLE tbl_subject(
	sb_code	CHAR(4),	
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)	
);

/*
tbl_subject, tbl_score table을 가지고
각 학생의 성적 리스트를 출력해보기
과목 리스트를 출력하고,
각 과목의 성적이 입력된 학생의 리스트를 확인하기

학번을 조건으로 하여 한 학생의 성적입력 여부를 확인하기

학생의 점수가 입력된 과목과 입력되지 않은 과목을 확인하고 싶다
*/
-- subquery 를 이용하는 방법
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN
		(SELECT * FROM tbl_score WHERE sc_stnum = "2021001") SC
			ON SC.sc_sbcode = SB.sb_code;
            
        
SELECT SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
			ON SC.sc_sbcode = SB.sb_code
            AND SC.sc_stnum = '2021001' LIMIT 5;


