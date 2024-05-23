CREATE TABLE MEMBERSHIP (
    membership_no NUMBER PRIMARY KEY,
    serialkey VARCHAR2(50) NOT NULL UNIQUE,
    member_no REFERENCES MEMBER(MEMBER_NO),
    GROUP_NO REFERENCES ARTIST_GROUP(GROUP_NO),
    STARTDAY DATE DEFAULT SYSDATE,
    ENDDAY DATE
);

CREATE SEQUENCE SEQ_MEMBERSHIP;

DROP TABLE MEMBERSHIP;

SELECT * FROM MEMBERSHIP;
SELECT * FROM MEMBER;
SELECT * FROM ARTIST_GROUP;

INSERT INTO MEMBERSHIP VALUES(SEQ_MEMBERSHIP.NEXTVAL,'A111-2222-1113',3,2,DEFAULT,'2025-05-23');
INSERT INTO MEMBERSHIP VALUES(SEQ_MEMBERSHIP.NEXTVAL,'A112-2222-1113',5,6,DEFAULT,'2025-05-23');
INSERT INTO MEMBERSHIP VALUES(SEQ_MEMBERSHIP.NEXTVAL,'A113-2222-1113',5,2,DEFAULT,'2025-05-23');
INSERT INTO MEMBERSHIP VALUES(SEQ_MEMBERSHIP.NEXTVAL,'A114-2222-1113',8,6,DEFAULT,'2025-05-23');