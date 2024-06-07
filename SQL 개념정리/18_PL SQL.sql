/* PL/SQL 
SQL의 조작언어
단점을 보완해서 SQL문장 내에서 변수의 정의 조건처리 반복처리 등 지원
오라클 자체에 내장되어있는 절차적언어 

[사용법]
DECLARE SECTION 변순 상수를 선언하는 부분

EXECYTABLE SECTION BEGIN 으로 시작 제어문 반복문 함수 정의 등 로직기술

EXCEPTION SECTION EXCEPTION 으로 시작 예외사항발생시 해결하기위한 문장기술

*/
DECLARE 
EMP_ID NUMBER;
EMP_NAME VARcHAR2(30);

BEGIN 
    EMP_ID:=888 ;
    EMP_NAME:='홍';
    
    DBMS_OUTPUT.PUT_LINE('EMP_ID:'||EMP_ID);
    DBMS_OUTPUT.put_LINE('EMP_NAME:'||emp_NAME);
END;























