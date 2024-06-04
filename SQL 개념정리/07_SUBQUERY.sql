/*
SUBQUERY 
하나의 SQL 문 안에 포함된 또 다른 SQL 문 
메인쿼리를 위해 보조역활을하는 쿼리문 
SELECT FROM WHERE HAVING 절에서 사용가능 
SQL 에서 작성하는 모든 구문은 쿼리라고 부름

--서브쿼리 예시1
부서코드가 노홍철 사원가 같은 소속인 직원으,ㅣ
이름 부서코드 조회하기


*/
--사원명이 노옹철인 사람 부서코드 조회
SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';

--2 부서코드가 d9인 직원조회
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE ='D9'

--3 부서코드가 노옹철사원과 같은소속의 직원명단 조회
--1 과 2에 작성한 쿼리를 하나로 합치기
SELECT EMP_NAME , DEPT_CODE 
FROM EMPLOYEE 
WHERE DEPT_CODE =(SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철');


--서브쿼리 예시2 
--전 직원의 평균급여보다 많은 급여를 받고있는 직원의 
--사번 이름 직급코드 급여 조회

--1 전 직원의 평균 급여구하기
SELECT AVG(SALARY)FROM EMPLOYEE;

--2. 직원들중 급여가 평균급여보다 많은 
--사원의 사번 이름 직급코드 급여 조회

SELECT EMP_NAME , EMP_ID , DEPT_CODE , SALARY
FROM EMPLOYEE
WHERE SALARY >=3000000;

--3. 메인쿼리2) 서브쿼리 1) 
--전 직원의 평균급여보다 많은 급여를 받고있는 직원조회

SELECT EMP_NAME , EMP_ID , DEPT_CODE , SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY)FROM EMPLOYEE);














