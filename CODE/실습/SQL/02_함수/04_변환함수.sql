-- CAST(값 AS 타입)
-- 문자열을 숫자로 변환
SELECT CAST('123' AS UNSIGNED) AS '숫자로변환';
SELECT CAST('123' AS UNSIGNED INT ) AS '숫자로변환';
;
-- 날짜 문자열을 날짜타입(DATE)로 변환
SELECT
    CAST('2025-04-30' AS DATE) AS '날짜로변환'
    , CAST('2025-04-30 11:36:50' AS DATETIME) AS '날짜로변환'
;

SELECT
    CAST('2025-04-30' AS YEAR) AS '날짜로변환'
;

-- 숫자를 문자로 변환
SELECT CAST(123 AS CHAR) AS '문자로 변환';

-- CONVERT(값, 타입)
-- 문자열을 DATE 타입으로 변환
SELECT CONVERT('2025-05-01', DATE) AS 'DATE 로 변환';

-- 숫자를 CHAR로 변환
SELECT CONVERT(456, CHAR) AS '문자로 변환';

-- FORMAT(숫자, 소수점 자리)
-- 123456.789 을 소수점 아래 둘째 자리까지 천단위 구분기호(,) 포함 출력
SELECT FORMAT(123456.789, 2) AS '포맷 숫자'

-- 123456.789 을 정수만 천단위 구분기호(,) 포함 출력
SELECT FORMAT(123456.789, 0) AS '포맷 숫자'

-- DATE_FROMAT(날짜, 형식)
-- 오늘 잘짜를 2025년04월30일 12시00분00초 형식으로 출력하시오
SELECT DATE_FORMAT(now(), '%Y년%m월%d일 %H시%i분%s초') as '현재 날짜 시간'
        ,DATE_FORMAT(now(), '%Y/%m/%d %H:%i:%s') as '현재 날짜 시간'
        ,DATE_FORMAT(now(), '%Y-%m-%d %H:%i:%s') as '현재 날짜 시간'
        ,DATE_FORMAT(now(), '%Y.%m.%d %H:%i:%s') as '현재 날짜 시간'
        ,STR_TO_DATE( '2025년04월30일 12시34분12초', '%Y년%m월%d일 %H시%i분%s초' ) as '문자-> 날짜'
        ,STR_TO_DATE( '2025/04/30 12:34:12', '%Y/%m/%d %H:%i:%s' ) as '문자-> 날짜'
        ,STR_TO_DATE( '2025-04-30 12:34:12', '%Y-%m-%d %H:%i:%s' ) as '문자-> 날짜'
        ,STR_TO_DATE( '2025.04.30 12:34:12', '%Y.%m.%d %H:%i:%s' ) as '문자-> 날짜'
;