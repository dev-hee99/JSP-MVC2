SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS exerciseboard;
DROP TABLE IF EXISTS expreply;
DROP TABLE IF EXISTS expboard;
DROP TABLE IF EXISTS weightboard;
DROP TABLE IF EXISTS expermember;




/* Create Tables */

-- �� ���̺�
CREATE TABLE exerciseboard
(
	email varchar(20) NOT NULL COMMENT 'email',
	regdate date COMMENT '��¥',
	part varchar(10) COMMENT '�����',
	ename varchar(20) COMMENT 'ename',
	set int(3) COMMENT '��Ʈ��',
	count int(3) COMMENT '����'
) COMMENT = '�� ���̺�';


-- �Խ���
CREATE TABLE expboard
(
	num int NOT NULL COMMENT 'num',
	email varchar(20) NOT NULL COMMENT 'email',
	-- 1. ��������
	-- 2. �����Խ���
	-- 3. ��������(�)
	-- 4. ��������(�Ĵ�)
	btype int(2) NOT NULL COMMENT '�Խ���Ÿ�� : 1. ��������
2. �����Խ���
3. ��������(�)
4. ��������(�Ĵ�)',
	subject varchar(20) COMMENT '����',
	content varchar(2000) COMMENT '����',
	file1 varchar(100) COMMENT '÷������',
	regdate datetime COMMENT '��¥',
	readcnt int(10) COMMENT '��ȸ��',
	recom int(10) COMMENT '��õ��',
	PRIMARY KEY (num)
) COMMENT = '�Խ���';


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


-- �� ���̺�
CREATE TABLE expreply
(
	seq int NOT NULL COMMENT '����',
	num int NOT NULL COMMENT 'num',
	email varchar(20) NOT NULL COMMENT 'email',
	name varchar(10) not null,
	content varchar(200) COMMENT '����',
	regdate datetime COMMENT '��¥',
	PRIMARY KEY (seq)
) COMMENT = '�� ���̺�';


-- �� ���̺�
CREATE TABLE weightboard
(
	email varchar(20) NOT NULL COMMENT 'email',
	-- 2020-12-17 ������ ��¥
	regdate date COMMENT '��¥ : 2020-12-17 ������ ��¥',
	weight float(4,1) COMMENT '������',
	bodyfat float(4,1) COMMENT 'ü�����',
	musclemass float(4,1) COMMENT '��ݱٷ�'
) COMMENT = '�� ���̺�';



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



