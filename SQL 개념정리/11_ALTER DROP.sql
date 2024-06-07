--DDL (date definition Languagel
--데이터 정의 언어로 객체를 만들고 수정하고 삭제 

--ALTER
--수정가능한것은 컬럼(추가/수정/삭제) 제약조건(추가/삭제)이름변경(테이블,컬럼,제약조건)
--작성법
--테이블을 수정하는경우 
--ALTER TABLE 테이블명 ADD / MODIFY/ DROP 수정할 내용

--1.제약조건 추가/삭제 

--대괄호는 생략가능 
--제약조건추가 ALTER TABLE 테이블명 
--ADD[CONSTRAINT 제약조건명]제약조건(컬럼명)[REFERENCES 테이블명(컬럼명)]];

CREATE TABLE dept_copy AS select*FROM department;

ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_PK PRIMARY KEY(DEPT_ID);
-->ALTER TABLE DEPT_COPY :DEPT_COPY테이블을 수정하겠다 
--ADD CONSTRAINT : 새로운 제약조건을 추가하는 값 
--DEPT_COPY_PK : 새 제약조건의 이름
--PRIMARY KEY(DEPT_ID); : DEPT_ID를 기본키로 설정 

--DEPT_COPY 테이블에서 DPT_TITLE컬럼에 UNIQUE제약조건추가 

ALTER TABLE DEPT_COPY ADD CONSTRAINT DEPT_COPY_TI UNIQUE(DEPT_TITLE);

--2. 컬럼 추가 / 수정 / 삭제 
--컬럼추가 : ALTER TABLE 테이블명 ADD(컬럼명 데이터타입[DEFAULT]'값']);

--컬럼 수정 : ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입; (데이터타입변경)
--> ALTER TABLE 테이블명 MODIFY DEFAULT '값';(기본값 변경)
-- 데이터타입 수정할경우 컬럼에 저장된 크기미만으로는 변경불가 

--컬럼 삭제 :ALTER TABLE 테이블명 DROP (삭제할컬럼명);
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼명;

--테이블에는 최소 1개 이상의 컬럼이 존재해야해서 모든컬럼 삭제는 x 

--DEPT_COPY 컬럼에 CNAME VARCHAR2(20)컬럼 추가 

SELECT * FROM DEPT_COPY;

ALTER TABLE DEPT_COPY ADD (CNAME VARCHAR2(20));

--DEPT_COPY 테이블에 LNAME VARCHAR2(30) 기본값은 한국으로 추가 
ALTER TABLE DEPT_COPY ADD(LNAME VARCHAR(30) DEFAULT '한국');

--DEPT_COPY 테이블의 DEPT_ID 컬럼의 데이터타입을 CHAR->VARCHAR2(3)변경
--ALTER TABLE DEPT_COPY MODIFY DEPT_ID VARCHAR2(3);


ALTER TABLE DEPT_COPY MODIFY DEPT_ID VARCHAR2(3);

--DEPT_COPY 테이블 CNAME,LNAME 삭제 
ALTER TABLE DEPT_COPY DROP (CNAME);

ALTER TABLE DEPT_COPY DROP COLUMN LNAME;

ALTER TABLE DEPT_COPY DROP (DEPT_TITLE);

ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;

--3 테이블 삭제 
--DROP TABLE 테이블명 [cascade constraint];

CREATE TABLE TB_1(
TB1_PK NUMBER PRIMARY KEY , TB_1_COL NUMBER
);

CREATE TABLE TB_2(
TB2_PK NUMBER PRIMARY KEY , TB_2_COL NUMBER REFERENCES TB_1
);

DROP TABLE DEPT_COPY;

DROP TABLE TB_2;
--1.TB2가 TB1의 폴링키로 참조하기떄문에 2먼저삭제 
DROP TABLE TB_1;

DROP TABLE TB_1 CASCADE CONSTRAINT;
--2.CASCADE CONSTRAINT 를 사용해서 제약조건까지 삭제조건을 없애버리기

CREATE TABLE DEPT_COPY AS SELECT*FROM department;

ALTER TABLE DEPT_COPY RENAME TO DCOPY;






















