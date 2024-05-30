--주석 작성하기이 
/*              크게하기                        */



--계정생성방법 
CREATE USER 아이디명 IDENTIFIED BY 비밀번호;

--생성된 계정에 접속+ 기본자원 관리권한 추가 
GRANT CONNECT, RESOURCE TO 아이디명;


/*테이블 생성하기 
테이블: 데이터베이스에서 모든 데이터를 포함하는 공간
    테이블명: 핵심과 관련된 내용을 설정할수있도록 작성
    CREATE TABLE 테이블명 (컬럼명 데이터타입);
*/
CREATE TABLE 직원 (직원번호 직원이름NUMBER(4), VARCHAR2(10);
/*
NUMBER : 수
VARCHAR2 : String과 같은 문자열 
*/

--데이터 추가하기 INSER
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "KH_T"."MEMBER" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_AGE" VARCHAR2(20 BYTE), 
	"M_PHONE" VARCHAR2(20 BYTE), 
	"M_DATE" VARCHAR2(20 BYTE)
 
INSERT INTO  MEMBER (M_ID,M_NAME,M_AGE,M_PHONE,M_DATE);
 VALUES('1', '김철수', '18', '1234123412', '2024-05-29');




--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  INSERT INTO CAFE (ID, C_NAME, C_ADDRESS, C_PHONE, C_TIME)
  VALUES(1,'투썸플레이스', '서울시서울시', '002020202', '9:30~18:00');



























