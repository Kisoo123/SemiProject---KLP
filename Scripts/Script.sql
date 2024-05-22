SELECT * FROM reply;

CREATE TABLE reply (
	reply_number NUMBER,
	feed_no NUMBER,
	reply_content varchar2(1000),
	reply_date DATE,
	likes NUMBER,
	memberno number
)
