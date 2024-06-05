/*
DDL (DATA DEFINITION LANGUAGE) : 데이터 정의 언어


OBJECT           CREATE    ALTER     DROP
객체                  만들고       수정하고     삭제하는 언어
 ------------------------------------------
오라클에서 객체 : 테이블(TABLE)  뷰(VIEW) 시퀀스(SEQUENCE)
                        인덱스(INDEX) 패키지(PACKAGE) 트리거(TRIGGER)
                        프로시져(PROCEDURE) 함수(FUNCTION) 
                        동의어(SYNONYM), 사용자(USER)
 ------------------------------------------                     
                        
CREATE
 - 테이블이나 인덱스, 뷰 등 다양한 데이터 베이스 객체를 생성하는 구문
 -- 테이블로 생성된 객체는 DROP 구문을 통해 제거할 수 있음
                        
1. 테이블 생성하기
 - 테이블이란 ? 
 -- 행(ROW)과 열(COLUMN)으로 구성되는 가장 기본적인 데이터베이스 객체
 --- 데이터베이스 내에서 모든 데이터는 테이블을 통해 저장
 
 --- [ 표현식 ]
 CREATE TABLE 테이블명 (
                    컬럼명 자료형(크기),
                    컬럼명 자료형(크기),
                    ...);   
                    
-----[ 자료형 ]
                    NUMBER : 숫자형(정수, 실수)
                    
                    CHAR(크기) : 고정길이 문자형 (2000BYTE)
                    VARCHAR2(크기) : 가변길이 문자형 (4000BYTE) VARCHAR1의 업그레이드 버전
                    
                    ABC 문자열을 CHAR VARCHAR2 저장하면 어떻게 되는가?
                    CHAR(10) 컬럼 : CHAR는 10을 모두 소진
                    VARCHAR2(10) 컬럼 : VARCHAR2 3만큼만 소진 나머지 7은 반환
                    
                    DATE : 날짜타입
                    BLOB : 대용량 사진 / 동영 / 파일 데이터 저장(4GB)
                    CLOB : 대용량 문자 데이터 (4GB)
                    
        UTF-8 
        영어, 숫자, 특수문자 == 1BYTE
        나머지 (한글 등)      == 3BYTE
*/

--USER_MEMBER 테이블 생성
--- 필요한 컬럼 :  아이디 비밀번호 이름 주민번호 가입일

-- 아이디    : USER_ID         / 자료형 VARCHAR2(20)
-- 비밀번호 : USER_PW        / 자료형 VARCHAR2(20)
-- 이름       : USER_NAME    / 자료형 VARCHAR2(15) --한글 5글자 까지 OK
-- 주민번호 : USER_SSN        / 자료형 CHAR(14)                   -- 14글자 고정
-- 가입일    : ENROLL_DATE / 자료형 DATE       -DEFAULT SYSDATE --현재 시간을 기본값으로 고정

CREATE TABLE "USER_MEMBER"(   
                    USER_ID  VARCHAR2(20),
                    USER_PW VARCHAR2(20),
                    USER_NAME VARCHAR2(15),
                    USER_SSN CHAR(14),
                    ENROLL_DATE DATE DEFAULT SYSDATE
  );
-- DEFAULT ( = 기본값) 컬럼의 기본값 지정 (필수 아님)
-- > DEFAULT 기본값을 지정하고 INSERT 나 UPDATE 문을 작성해줄 때
---> 지정한 기본값이 들어감

--테이블 잘 만들어졌는지 확인
SELECT * FROM USER_MEMBER;

-- 2. 컬럼에 주석으로 컬럼에 대한 설명 추기
-- [표현식]
-- COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용' ;  -> 주석내용 "" 사용 X

COMMENT ON COLUMN "USER_MEMBER".USER_ID    IS '회원아이디';

---제약 조건 
--UNIQE PRIMARY KEY FOREIGN KEY CHECK
/*
제약조건(CON STR AIN TS)
사용자가 원하는 조건의 데이터만 유지하기위해 특정컬럼에 설정하는제약

데이터무결성 보장을 목적으로 함 
+입력데이터에 문제가없는지 자동으로 검사하는 목적
데이터수정/삭제 가능 여부 검사등을 목적으로함 
--> 제약조건을 위배하는 DML구문은 수행할 수 없음 

제약조건 종류 
PRIMARY KEY, NOT NULL , UNIQUE , CHECK , FOREIGN KEY

제약조건 확인 
USER_CONSTRAINTS:사용자가 작성한 제약조건을 확인하는 딕셔너리뷰

OWNER : 유저 아이디 
CONSTRAINT_NAME: 제약조건 이름
CONSTRAINT_TYPE: 제약조건 유형 
                C:CHECK
                P:PRIMARY KEY
                U:UNIQUE
                R:FOREIGN KEY
                V:view
    TABLE_NAME : 제약조건이 적용된 테이블 이름 
    
                
*/  
DESC USER_CONSTRAINTS;

SELECT *FROM user_constraints;

--1.NOT NULL
--해당 컬럼에 반드시 값이 존재해야하는 경우 사용 
--삽입/수정시 NULL값을 허용하지않도록 컬럼 레벨에서 제한

--NOT NULL을 지정한 테이블 생성
CREATE TABLE USER_TEST_TABLE (
USER_NO NUMBER(10,0)NOT NULL,
USER_ID VARCHAR2(30),
USER_PWD VARCHAR2(30),
USER_NAME VARCHAR2(20),
GENDER VARCHAR2(10),
PHONE VARCHAR2(30),
EMAIL VARCHAR2(50)
);

INSERT INTO USER_TEST_TABLE
    VALUES(1,'사용자1','pw1','홍길동','남','010-1111-1111',
    'hong@honh.com');
    
--USER_NO NUMBER(10,0)NOT NULL, 
--NOT NULL선언했기 떄문에 null값을 넣을수없음

--2 UNIQUE 제약조건
--컬럼에 입력값에대해 중복을 제한하는 제약조건 
--컬럼 레벨에서 설정가능 , 테이블레벨에서 설정가능 
--단, UNIQUE 제약조건이 설정된 컬럼에 null값은 중복삽입가능 

--UNIQUE 제약조건이 들어간 조건 테이블 생성 
CREATE TABLE UNIQUE_TABLE (
USER_NO NUMBER(10,0),

--USER_ID VARCHAR2(20) : 컬럼레벨 제약조건 (이름x) 
USER_ID VARCHAR2(20) CONSTRAINT USER_ID_U UNIQUE,
-- CONSTRAINT 제약 조건명 제약조건종류 
--컬럼 레벨 제약조건 ( 이름 O) 

USER_NAME VARCHAR2(30), --테이블 레벨로 UNIQUE제약조건 설정 

--테이블레벨--
--UNIQUE(USER_NAME) =X 이름이없음
CONSTRAINT USER_NAME_U UNIQUE(USER_NAME));

CREATE TABLE KH_CAFE (
CAFE_ID NUMBER(10,0) PRIMARY KEY,
CAFE_NAME VARCHAR2(100) NOT NULL,
CAFE_PHONE VARCHAR2(2) CONSTRAINT CAFE_PHONE_P UNIQUE,
CAFE_ADDRESS VARCHAR2(100),
CONSTRAINT CAFE_ADDRESS_A UNIQUE(CAFE_ADDRESS)
);

INSERT INTO kh_cafe(CAFE_ID,CAFE_NAME,CAFE_PHONE,CAFE_ADDRESS)
    VALUES(1,'메가커피','02-1111-1111','서울시강남구');

--테이블 생성시 phone 크기가 2이기 떄문에
--ALTER 로 크기변경을 한다 

ALTER TABLE KH_CAFE MODIFY(CAFE_PHONE VARCHAR(100));

COMMIT;


--3.PRIMARY KEY (기본키) 제약조건 
/*
테이블에서 한 행의 정보를 찾기위해 사용할 컬럼을 의미함 
테이블에 대한 식별자 (IDENTIFIER)역활을함
NOT NULL + UNIQUE 제약조건의 의미
한 테이블당 한개만 가능 
컬럼레벨 테이블 레벨 둘 다 설정가능 
한개컬럼에 설정할수있고 여러개의컬럼을 묶어서는 불가능

*/
/*
CREATE TABLE 테이블명( 
--방법1. 
컬럼명 자료형(정수자리값,실수자리값) PRIMARY KEY,
--방법2.
컬럼명 자료형(정수자리값,실수자리값) CONSTRAINT 
index에 저장할이름 PRIMARY KEY,
-- 방법3.
컬럼명 자료형(정수자리값,실수자리값) CONSTRAINT 
Uindex에 저장할이름 PRIMARY KEY(컬럼명)

);
*/
CREATE TABLE USER_PRIMARY_TABLE( 

--방법2.
USER_NO NUMBER(10,0) CONSTRAINT 
USER_NO_PK PRIMARY KEY,
USER_NAME VARCHAR2(200)
);

INSERT INTO user_primary_table
VALUES (1,'홍길동');


INSERT INTO user_primary_table
VALUES (1,'이순신');
--기본키 중복으로 오류 

INSERT INTO user_primary_table
VALUES (NULL,'이순신');
--기본키가 NULL이기때문에 오류발생 

--UNIQUE 랑 PRIMARY KEY 차이
/*
UNIQUE 는 NULL한개는 허용됨 두개이상 안됨 
PRIMARY KEY NULL허용안되고 중복안됨
*/

/*
FOREIGN KEY 제약조건
참조된 다른테이블의 컬럼이 제공하는 값만 사용가능 

CONSTRAINT 인덱스값 REFERENCES 컬럼명(참조할키);


*/
CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER(10,0) PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
    );
    INSERT INTO USER_GRADE VALUES(10,'일반회원');
    INSERT INTO USER_GRADE VALUES(20,'우수회원');
    INSERT INTO USER_GRADE VALUES(30,'특별회원');

commit;

CREATE TABLE USER_FK(
USER_NO NUMBER(10,0)PRIMARY KEY,
USER_ID VARCHAR2(20)UNIQUE,
USER_PW VARCHAR2(30)NOT NULL,
GRADE_CODE NUMBER CONSTRAINT GRA_A REFERENCES USER_GRADE(GRADE_CODE)
);

INSERT INTO USER_FK VALUES(1,'USER01','PW1',10);
SELECT*FROM user_fk;

INSERT INTO USER_FK VALUES(2,'USER02','PW2',20);

INSERT INTO USER_FK VALUES(3,'USER03','PW3',30);

INSERT INTO USER_GRADE VALUES (40,'플레티넘');

INSERT INTO USER_FK VALUES(4,'USER04','PW4',40);

dELETE FROM USER_GRADE WHERE GRADE_CODE =10;
--10을 참조하는 자식메서드떄문에 삭제불가 

--CASCADE : 부모키 삭제시 참조하는 자식의 행도 모두삭제 
--삭제는아니고 null로 바꾸고싶으면
--NULL적용

-------------------------------------------

/*
CREATE TABLE 부모테이블(
    컬럼1_자료형 NUMBER(10,0) PRIMARY KEY,
    컬럼2_자료형 VARCHAR2(30) NOT NULL
    );
  

CREATE TABLE 자식테이블(
컬럼1_자료형 NUMBER(10,0)PRIMARY KEY,
컬럼2_자료형 VARCHAR2(20)UNIQUE,
컬럼3_자료형 VARCHAR2(30)NOT NULL,
--방법1 : 마음대로 삭제불가
컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 부모테이블(부모컬럼1)
--방법2 : 부모키 삭제시 자식키를 null로 변경하는옵션-> ON DELETE SET NULL
컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 
부모테이블(부모컬럼1) ON DELETE SET NULL
--방법3 : 부모키 삭제시 자식키도 모두삭제-> ON DELETE CASCADE
컬럼4 NUMBER CONSTRAINT 인덱스이름 REFERENCES 
부모테이블(부모컬럼1) ON DELETE CASCADE
);
*/








