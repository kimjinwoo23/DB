

--------SUBQUERY 실습 

--1.각 직원의 급여가 부서 평균급여보다 높은 직원이름 급여조회

--1) 부서평균 급여 구하기 
SELECT AVG(SALARY)
FROM EMPLOYEE E
WHERE DEPT_CODE=E.DEPT_CODE;
--2) 직원의 이름과 급여조회
SELECT EMP_NAME , SALARY
FROM EMPLOYEE
WHERE SALARY >3000000;

--3) 서브쿼리로 합치기 

SELECT EMP_NAME , SALARY
FROM EMPLOYEE
WHERE SALARY >(SELECT AVG(SALARY)
                FROM EMPLOYEE E
                WHERE DEPT_CODE=E.DEPT_CODE);



--2.최대 급여를 받는 직원의 이름과 급여 조회
SELECT EMP_NAME ,SALARY
FROM EMPLOYEE;




--3 D5 부서의 평균 급여보다 높은 급여를 받는 직원들의 이름조회
SELECT AVG(SALARY) 
FROM EMPLOYEE;

SELECT EMP_NAME ,DEPT_CODE
FROM employee
--WHERE SALARY >

--1 급여평균구하기
SELECT AVG(SALARY)
FROM EMPLOYEE;

--2 각 직급의 평균구한걸 조회
SELECT JOB_NAME,AVG(SALARY)
FROM JOB;
--JOB 테이블에는 급여가없기때문에 에러발생 
--3 1과 2의 평균을 합해서 조회 
SELECT JOB_NAME ,(SELECT AVG(SALARY)
                    FROM EMPLOYEE)
FROM JOB;

/*
JOB테이블에서 JOB_NAME 선택 

서브쿼리 
EMPLOYEE 테이블에서 전체직원의 평균급여를 계산 
JOB테이블의 각 행에대해 평균급여가 계산된 서브쿼리가 실행되기때문에
각 직급에 대해 동일한 평균 급여값을 반환 

각 직급별 개별적인 평균급여는 반환하지못함 
만약에 각 직급별로 평균급여를 계산해서 
개별적인 평균급여도 반환하길 바란다면 
서브쿼리에 where e.job_code , j.job_code를 넣어줘야함

*/
SELECT JOB_NAME, 
(SELECT AVG(SALARY)
FROM EMPLOYEE E
WHERE e.JOB_CODE =j.JOB_CODE)
FROM JOB j

--SELECT 를 활용한 서브쿼리 실습 

SELECT DEPT_TITLE,
    (SELECT COUNT(*)FROM EMPLOYEE E 
    WHERE E.DEPT_CODE = D.DEPT_ID
    AND E.BONUS > 0.2 )AS"BONUS COUNT"
    FROM DEPARTMENT D;

--부서별로 최고 급여와 최소급여를 조회 
SELECT DEPT_TITLE,
(SELECT MAX(SALARY) 
FROM EMPLOYEE E 
WHERE E.DEPT_CODE = D.DEPT_ID)AS"최고급여",
(SELECT MIN(SALARY) 
FROM EMPLOYEE E 
WHERE E.DEPT_CODE = D.DEPT_ID)AS"최저급여"

FROM DEPARTMENT D;


--부서별 직원수 조회 SELECT 
--외부쿼리에서 DEPT_CODE 
--FROM DEPARTMENT 
SELECT DEPT_TITLE, 
(SELECT COUNT(*) FROM EMPLOYEE E 
WHERE E.DEPT_CODE= D.DEPT_ID)AS"직원수"
FROM DEPARTMENT D;



--2) 부서별로 직원수가 5명이상인 부서의 부서명과 직원수조회
--SELECT 서브쿼리 
--WHERE 서브쿼리 
--외부  DEPT_TITLE 
SELECT DEPT_TITLE, 
(SELECT COUNT(*) FROM EMPLOYEE E 
WHERE E.DEPT_CODE= D.DEPT_ID)
FROM DEPARTMENT D
WHERE ( SELECT COUNT(*)
FROM EMPLOYEE E 
WHERE E.DEPT_CODE = D.DEPT_ID)>=5;

































