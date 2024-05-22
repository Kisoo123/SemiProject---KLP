SELECT * FROM reply;

CREATE TABLE reply (
	reply_number NUMBER,
	feed_no NUMBER,
	reply_content varchar2(1000),
	reply_date DATE,
	likes NUMBER,
	memberno number
)

SELECT * FROM MEMBER;

CREATE SEQUENCE REPLY_SEQ
START WITH 1
INCREMENT BY 1