/*
함수
컬럼값이나 지정된 값을 읽어 연산한 결과를 반환 

단일 행 함수: N개의 행의 컬럼값을 전달하여 N개의 결과가반환 

그룹 함수 : N개의 행의 컬럼값을 전달하여 1개의 결과가 반환 

함수는 SELECT ,WHERE , ORDER BY , HAVING 절들에서 사용가능 

SELECT 절 : 찾는 기준이 아닌 눈으로 표기되는 총합 
계산 결과등에 대한 것을 눈으로봤을때 정리해놓은 컬럼 

WHERE 절 : 찾는 조건이되는 행을 작성 길이,크기,결과가 조건에 
    부합하는 결과만 볼 수 있도록 설정 
    




--문자열 관련함수 

LENGTH 문자열|컬럼명 : 문자열의 길이반환    

*/
SELECT 'HELLO WORLD' , LENGTH('HELLO WORLD')
FROM DUAL;


--EMPLOYEE 
--사원명 이메일 길이조회
--이메일 길이 오름차순 정렬 
--12이하인 이메일만조회
SELECT EMP_name,email,length(email)AS"이메일길이"
FROM EMPLOYEE 
WHERE length(email) <=12 --12길이보다 이하인 이메일 조회
ORDER BY "이메일길이";


--INSTR(문자열 | 컬럼명 '찾을문자열 작성'[찾는것을 시작할 위치[순번]]
--찾을 위치부터 지정된 순번을 지정해서 문자열의 시작위치를 반환 

--LIkE 와 INSTR 차이 

SELECT 'AABAACAABBAA',INSTR('AABAACAABBAA','B')
FROM DUAL;


SELECT 'AABAACAABBAA',INSTR('AABAACAABBAA','B',5)
FROM DUAL;

SELECT 'AABAACAABBAA',INSTR('AABBABACACACB','B',5,2)
FROM DUAL;

/*
SUBSTR(문자열|컬럼명,시작위치[길이])
문자열을 시작위치부터 지정한 길이까지 잘라내 반환 
길이를 지정하지않을경우엔 시작위치부터 끝까지 잘라 반환 

*/

SELECT SUBSTR('ABCDE',2,3)
FROM DUAL;
--abcde 문자열의 2번째 위치에서 3만큼의 길이를 반환 

SELECT SUBSTR('ABCDE',4)
FROM DUAL;

--abcde 에서 4번째 위치한 D에서 길이를 지정하지않아 마지막까지 반환

SELECT EMP_NAME,SUBSTR(EMAIL , 1 ,INSTR(EMAIL,'@')-1)AS"이메일아이디"
FROM EMPLOYEE 
ORDER BY "이메일 아이디";

/*
INSTR(EMAIL,'@')이메일 주소에서 @을 찾아
찾은다음에 @가 표시되지않게 -1설정을 해서 @제거

*/









