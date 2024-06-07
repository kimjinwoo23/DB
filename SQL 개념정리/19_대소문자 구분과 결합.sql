/*
LOWER/UPPER INITCAP

컬럼에 문자혹은문자열을 소문자 대문자 첫글자만 대문자로 바꿔서 반환
*/
--사용법 LOWER:모두 소문자로 변환해서 적용

SELECT LOWER('welcom to my worLD')
FROM DUAL;

--사용법 UPPER : 모두 대문자로 변환해서 적용

SELECT UPPER('welcom to my worLD')
FROM DUAL;

--사용법 INITCAP :첫글자만 대문자로 변환해서 적용

SELECT INITCAP('welcom to my worLD')
FROM DUAL;

--문자 처리함수 CONCAT 
/*
CONCAT : 컬럼의 문자 혹은 문자열을 두개 전달받아 하나로합친후 반환
[작성법]
CONcAT(STRING,STRING)
*/
--가상테이블 사용해서 확인
SELECT CONCAT('가나다라','ABCD')FROM DUAL;

SELECT '가나다라'||'ABCD' FROM DUAL;


/*
CONCAT 함수 || 연산자 차이 
두개의 문자열을 결합 두 개 이상은 불가 
[작성법]
CONCAT(STRING1,STRING2)

|| : 두 개 이상의 문자열을 결합할때 사용 
[작성법]
STRING1||STRING2||STRING3 ...여러개 결합가능 


*/

















































