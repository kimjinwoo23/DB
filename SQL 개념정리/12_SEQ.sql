/*
SEQUENCE(순서 , 연속)
순차적으로 일정한 간격의 숫자를 발생시키는 객체 
(자동번호생성기)

작성법 
CREATE SEQUNCE 시퀀스 이름 
[START WITH 숫자] 처음발생시킬 시작값 지정,생략하면 자동으로 1 이 기본값으로 설정
[INCREAMENT BY 숫자] 다음값에대한 증가값을 설정, 생략하면 자동으로 1씩증가
[MAXVALUE 숫자|NAMAXVALUE] 발생시킬 최대값 지정 
[MINVALUE 숫자|NINAXVALUE] 발생시킬 최소값 지정


사용방법.
시퀀스명,NEXTVAL:다음 시퀀스 번호를 가져옴

시퀀스명.currval:  현재 시퀀스 번호를 얻어옴 
            주의점: 시퀀스가 생성되자마자 호출하면 오류 발생 
            마지막으로 호출한 nextval값을 반환

*/

CREATE TABLE TB_TEST(
    TEST_NO NUMBER PRIMARY KEY,
    TEST_NAME VARCHAR2(30) NOT NULL
    );
CREATE SEQUENCE SEQ_TEST_NO
START WITH 100
INCREMENT BY 5
MAXVALUE 150
;
--위 작성된 내용들 전부 생략가능 sql에서 설정한기본값이 자동으로 매겨짐

--INSERT 시 시퀀스 사용하기 

INSERT INTO TB_TEST VALUES (SEQ_TEST_NO.nextval,'홍');

SELECT *FROM TB_TEST;

/*
시퀀스 값 변경(ALTER)
CREATE 구문과 똑같지만 START WITH 옵션제외함

*/

























