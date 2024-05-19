--그룹 삭제시 또는 회원삭제시 데이터 삭제됨
CREATE TABLE subscribe (
	subscribe_no number	PRIMARY key,
	group_no number REFERENCES artist_group(group_no) ON DELETE cascade, 
	member_no NUMBER REFERENCES MEMBER(member_no) ON DELETE cascade
);

SELECT * from subscribe;
SELECT * from MEMBER;
CREATE SEQUENCE seq_subscribe_no
nocache
nocycle;

--회원 구독 더미 데이터 추가(김말년 회원qwerty -> iu, aespa)
INSERT INTO SUBSCRIBE values(seq_subscribe_no.nextval, 4,4);
INSERT INTO SUBSCRIBE values(seq_subscribe_no.nextval, 5,4);

SELECT * FROM subscribe 
	RIGHT JOIN ARTIST_GROUP USING(group_no)
	LEFT JOIN MEMBER using(member_no) 
;
SELECT * FROM subscribe 
	LEFT JOIN MEMBER using(member_no) 
	LEFT JOIN ARTIST_GROUP USING(group_no) 
where member_id='qwerty'
;