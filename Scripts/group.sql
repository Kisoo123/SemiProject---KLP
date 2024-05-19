CREATE TABLE artist_group (
	group_no number	PRIMARY key,
	group_name varchar2(20),
	member_count number DEFAULT 1 NOT null,
	group_debutday	DATE NOT NULL,
	group_company varchar2(20),
	group_img	varchar2(100),
	unique(group_name)
);

--DROP TABLE ARTIST_GROUP ;
SELECT * from artist_group;
CREATE SEQUENCE seq_group_no
nocache
nocycle;
SELECT *FROM MEMBER;
--그룹 등록(완료)
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'newJeans', 5, to_date('22/07/22','RR/MM/DD'),'ADOR', 'newjeans.jpeg');
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'LE SSERAFIM', 5, to_date('22/05/02','RR/MM/DD'),'Source Music', 'le sserafim.jpeg');
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'RIIZE', 7, to_date('23/09/04','RR/MM/DD'),'SM', 'riize.jpeg');
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'IU', 1, to_date('08/09/18','RR/MM/DD'),'EDAM', 'iu.jpg');
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'easpa', 4, to_date('20/11/17','RR/MM/DD'),'SM', 'aespa.jpeg');
INSERT INTO ARTIST_GROUP values(seq_group_no.nextval, 'SEVENTEEN', 13, to_date('15/05/26','RR/MM/DD'),'PLEDIS', 'seventeen.jpeg');