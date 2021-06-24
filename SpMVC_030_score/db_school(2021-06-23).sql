CREATE DATABASE db_school;
USE db_school;
CREATE TABLE tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL,	
	st_tel	VARCHAR(15)	NOT NULL,
	st_addr	VARCHAR(125)		
);

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel)
VALUES('2021001','홍길동','컴공과',3,'010-111-1234');
COMMIT;

DROP TABLE tbl_score;
CREATE TABLE tbl_score(
sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
sc_stnum	CHAR(8)	NOT NULL,	
sc_sbcode	CHAR(4)	NOT NULL,
sc_score	INT	NOT NULL	
);

INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021001','S001',90);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021002','S002',80);
INSERT INTO tbl_score (sc_stnum, sc_sbcode, sc_score)
VALUES('2021003','S003',70);

CREATE TABLE tbl_subject(
	sb_code	CHAR(4),	
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)	
);

INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUES('S001','국어','홍길동');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUES('S002','영어','이몽룡');
INSERT INTO tbl_subject (sb_code, sb_name, sb_prof)
VALUES('S003','수학','성춘향');


