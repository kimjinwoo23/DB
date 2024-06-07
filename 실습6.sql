CREATE TABLE USERS( 
USER_ID NUMBER PRIMARY KEY,
NAME VARCHAR2(50),
EMAIL VARCHAR2(100),
PASSWORD VARCHAR2(100),
CREATEDDATE DATE 
);

INSERT INTO USERS(
user_id,
NAME ,
EMAIL,
PASSWORD,
CREATEDDATE
)VALUES(
  1,'홍길동','hong@example.com','password123',sysdate) ;
INSERT INTO USERS(
user_id,
NAME ,
EMAIL,
PASSWORD,
CREATEDDATE
)VALUES(
  2,'김철수','kim@example.com','mypassword',sysdate) ;
INSERT INTO USERS(
user_id,
NAME ,
EMAIL,
PASSWORD,
CREATEDDATE
)VALUES(
  3,'이영희','lee@example.com','securepass',sysdate) ;

SELECT* FROM USERS;

CREATE TABLE board(
POSTID number ,
userid number ,
title varchar2(200) not null,
content clob not null,
CREATEDDATE DATE 
); 
CREATE SEQUENCE board;

INSERT INTO board VALUES(
board1.nextval,1,'첫번째 게시물','이것은 첫번째 게시물의 내용입니다',sysdate);

INSERT INTO board VALUES(
board1.nextval,2,'두번째 게시물','이것은 두번째 게시물의 내용입니다',sysdate);


INSERT INTO board VALUES(
board1.nextval,3,'세번째 게시물','이것은 세번째 게시물의 내용입니다',sysdate);




