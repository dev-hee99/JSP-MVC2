SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS exerciseboard;
DROP TABLE IF EXISTS expreply;
DROP TABLE IF EXISTS expboard;
DROP TABLE IF EXISTS weightboard;
DROP TABLE IF EXISTS expermember;




/* Create Tables */

-- 새 테이블
CREATE TABLE exerciseboard
(
	email varchar(20) NOT NULL COMMENT 'email',
	regdate date COMMENT '날짜',
	part varchar(10) COMMENT '운동부위',
	ename varchar(20) COMMENT 'ename',
	set int(3) COMMENT '세트수',
	count int(3) COMMENT '개수'
) COMMENT = '새 테이블';


-- 게시판
CREATE TABLE expboard
(
	num int NOT NULL COMMENT 'num',
	email varchar(20) NOT NULL COMMENT 'email',
	-- 1. 공지사항
	-- 2. 자유게시판
	-- 3. 정보공유(운동)
	-- 4. 정보공유(식단)
	btype int(2) NOT NULL COMMENT '게시판타입 : 1. 공지사항
2. 자유게시판
3. 정보공유(운동)
4. 정보공유(식단)',
	subject varchar(20) COMMENT '제목',
	content varchar(2000) COMMENT '내용',
	file1 varchar(100) COMMENT '첨부파일',
	regdate datetime COMMENT '날짜',
	readcnt int(10) COMMENT '조회수',
	recom int(10) COMMENT '추천수',
	PRIMARY KEY (num)
) COMMENT = '게시판';


-- expermember
CREATE TABLE expermember
(
	email varchar(20) NOT NULL COMMENT 'email',
	pass varchar(20) NOT NULL COMMENT 'pass',
	NAME varchar(20) NOT NULL COMMENT 'NAME',
	weight float(4,1) DEFAULT NULL COMMENT 'weight',
	chgweight float(4,1) DEFAULT NULL COMMENT 'chgweight',
	height float(4,1) DEFAULT NULL COMMENT 'height',
	pwquestion varchar(100) DEFAULT 'NULL' COMMENT 'pwquestion',
	pwanswer varchar(100) DEFAULT 'NULL' COMMENT 'pwanswer',
	gender int DEFAULT NULL COMMENT 'gender',
	picture varchar(200) DEFAULT 'NULL' COMMENT 'picture',
	PRIMARY KEY (email),
	UNIQUE (NAME)
) COMMENT = 'expermember' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 새 테이블
CREATE TABLE expreply
(
	seq int NOT NULL COMMENT '순서',
	num int NOT NULL COMMENT 'num',
	email varchar(20) NOT NULL COMMENT 'email',
	name varchar(10) not null,
	content varchar(200) COMMENT '내용',
	regdate datetime COMMENT '날짜',
	PRIMARY KEY (seq)
) COMMENT = '새 테이블';


-- 새 테이블
CREATE TABLE weightboard
(
	email varchar(20) NOT NULL COMMENT 'email',
	-- 2020-12-17 형식의 날짜
	regdate date COMMENT '날짜 : 2020-12-17 형식의 날짜',
	weight float(4,1) COMMENT '몸무게',
	bodyfat float(4,1) COMMENT '체지방률',
	musclemass float(4,1) COMMENT '골격근량'
) COMMENT = '새 테이블';



/* Create Foreign Keys */

ALTER TABLE expreply
	ADD FOREIGN KEY (num)
	REFERENCES expboard (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE exerciseboard
	ADD FOREIGN KEY (email)
	REFERENCES expermember (email)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE expboard
	ADD FOREIGN KEY (email)
	REFERENCES expermember (email)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE expreply
	ADD FOREIGN KEY (email)
	REFERENCES expermember (email)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE weightboard
	ADD FOREIGN KEY (email)
	REFERENCES expermember (email)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



