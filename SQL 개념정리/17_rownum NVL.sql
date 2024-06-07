
/*
ROWNUM
쿼리의 결과 집합에서 각 행에 순차적으로 1부터 시작하는 번호를부여 

결과집합의 크기를 제한가능 
*/
--예시1:상위 5개의 행만 선택하는예제
SELECT ROWNUM,EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE ROWNUM <=5;

--정렬된 결과 집합에서 상위5개 행만선택 

--예제2 : 급여가높은 상위5명 선택
SELECT ROWNUM,EMP_ID,EMP_NAME,SALARY
FROM(SELECT EMP_ID,EMP_NAME,SALARY FROM EMPLOYEE 
ORDER BY SALARY DESC) 
WHERE ROWNUM <=5;

SELECT EMP_ID,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE ROWNUM >5;

SELECT ROWNUM ,EMP_NAME,SALARY
FROM EMPLOYEE
WHERE ROWNUM <=3
ORDER BY SALARY DESC;

/*
NVL : NULL로 되어있는 컬럼의 값을 지정한 숫자또는 문자로변경해서 반환
사용법 
NVL(컬럼명,컬럼값이 null일때 변경할 값 ) 

NVL2 : null이 아닌 컬럼의 값을 지정한숫자 또는 문자로변경해서 반환
NULL로 되어있는 컬럼의 값을 지정한 숫자또는 문자로변경해서 반환
사용법 
NVL2(컬럼명, null이 아닌경우 변경할 값   ,컬럼값이 null일때 변경할 값 ) 

EMPLOYEE 테이블에서 
사번 이름 전화번호 조회
전화번호가 없으면 없음으로 조회
*/
SELECT EMP_ID,EMP_NAME , NVL(PHONE,'없음')AS "전화번호"
FROM EMPLOYEE;

/*
이름 급여 성과급(급여*보너스)조회
성과금이없다면 0으로 표시
*/
SELECT EMP_NAME,SALARY,NVL(SALARY*BONUS,0)AS"성과급"
FROM EMPLOYEE;


/*
EMPLOYEE 테이블에서 사번, 이름, 전화번호 조회
전화번호가 없으면 없음으로 표기 
있으면 010********로 변경해서 조회
*/
SELECT EMP_ID,EMP_NAME,NVL2(PHONE,'010********','없음')AS"전화번호"
FROM EMPLOYEE;














