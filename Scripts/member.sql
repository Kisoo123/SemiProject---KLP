CREATE TABLE MEMBER (
    member_no NUMBER PRIMARY KEY,
    member_id VARCHAR2(20) NOT NULL,
    member_pw VARCHAR2(20) NOT NULL,
    member_name VARCHAR2(20) NOT NULL,
    gender VARCHAR2(10) CHECK (gender IN ('M', 'F')),
    phone VARCHAR2(100) NOT NULL,
    address VARCHAR2(100),
    address_detail varchar2(200),
    email VARCHAR2(20) NOT NULL,
    birth DATE NOT NULL,
    nickname VARCHAR2(50) NOT NULL,
    introduce VARCHAR2(300) DEFAULT '안녕하세요! 반가워요!' NOT NULL,
    profile_img_Oriname VARCHAR2(50) DEFAULT '기본프로필.png',
    member_grade VARCHAR2(20) DEFAULT '회원' CHECK (member_grade IN ('회원', '아티스트', '관리자')),
    enroll_date DATE DEFAULT SYSDATE,
    UNIQUE (member_id),
    UNIQUE (nickname)
);

ALTER TABLE member MODIFY (nickname VARCHAR2(50));

COMMENT ON COLUMN member.member_no IS '회원번호';
COMMENT ON COLUMN member.member_id IS '회원아이디';
COMMENT ON COLUMN member.member_pw IS '회원비밀번호';
COMMENT ON COLUMN member.member_name IS '회원이름';
COMMENT ON COLUMN member.address IS '회원주소';
COMMENT ON COLUMN member.address_detail IS '회원상세주소';
COMMENT ON COLUMN member.phone IS '회원연락처';
COMMENT ON COLUMN member.gender IS '회원성별';
COMMENT ON COLUMN member.enroll_date IS '회원등록일';
COMMENT ON COLUMN member.birth IS '회원생일';
COMMENT ON COLUMN member.nickname IS '닉네임';
COMMENT ON COLUMN member.profile_img_Oriname IS '프로필사진';
COMMENT ON COLUMN member.member_grade IS '회원등급';
COMMENT ON COLUMN member.email IS '이메일';
COMMENT ON COLUMN member.introduce IS '자기소개';

--SELECT * FROM member;
--drop table member; 
create sequence seq_member_no
nocache
nocycle;
--drop SEQUENCE seq_member_no;
--select * from user_sequences;
--create sequence seq_nickname; 검색해보니까 어려워서 생략 자바에서 만들자..


--관리자(등록완료)
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'admin','1234','관리자','F','01012345678',null, NULL,'admin@naver.com',to_date('96/07/05','RR/MM/DD'),'관리자','관리자입니다.',DEFAULT,'관리자',to_date('24/05/05','RR/MM/DD'));

--아티스트(보류)
--INSERT INTO MEMBER VALUES (seq_member_no,'admin','1234','관리자','F',"","",'admin@naver.com','01012345678',to_date('96/07/05','RR/MM/DD'),'관리자','',DEFAULT,'관리자',to_date('24/05/05','RR/MM/DD'));
--INSERT INTO MEMBER VALUES (seq_member_no,'admin','1234','관리자','F',"","",'admin@naver.com','01012345678',to_date('96/07/05','RR/MM/DD'),'관리자','',DEFAULT,'관리자',to_date('24/05/05','RR/MM/DD'));
--INSERT INTO MEMBER VALUES (seq_member_no,'admin','1234','관리자','F',"","",'admin@naver.com','01012345678',to_date('96/07/05','RR/MM/DD'),'관리자','',DEFAULT,'관리자',to_date('24/05/05','RR/MM/DD'));

--일반회원(등록완료)
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'abcde','1234','아무개','M','01012345678',null, NULL,'abcde@naver.com',to_date('99/07/05','RR/MM/DD'),'닉네임아무개','안녕하세요, 아무개입니당..',DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'qwerty','asdf','김말년','M','01098765432',null,null,'qwerty@naver.com',to_date('93/02/05','RR/MM/DD'),'김말이','김말이는 맛있어',DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES (seq_member_no.nextval,'hihiroo','1234','김안녕','F','01023454635',null,null,'hihiroo@naver.com',to_date('99/12/05','RR/MM/DD'),'heyHi','모두들 안녕하신가요',DEFAULT, DEFAULT, DEFAULT);