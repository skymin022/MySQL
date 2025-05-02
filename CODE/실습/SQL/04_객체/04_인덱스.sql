-- Active: 1745889744480@@127.0.0.1@3306@employees
-- index 생성 전 성능 확인
SET PROFILING = 1;

-- 쿼리
SELECT last_name
        ,COUNT(*) count
FROM employees
GROUP BY last_name
ORDER BY COUNT desc
LIMIT 1;

SELECT NOW(6);
-- 쿼리
SELECT *
FROM employees
WHERE last_name = 'Baba'
    AND gender = 'M'
    ;
SELECT NOW(6);

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;



SELECT NOW(6);
-- 쿼리
SELECT *
FROM employees
WHERE last_name = 'Baba'
    AND gender = 'M'
    ;
SELECT NOW(6);

-- 인덱스 전
/*
2025-05-02 10:57:08.640313
2025-05-02 10:57:08.770380
*/

-- 인덱스 후
/*
2025-05-02 11:03:18.632446
2025-05-02 11:03:18.682613
*/


-- 인덱스 생성
CREATE INDEX index_lastname_gender ON employees (last_name, gender);
-- 인덱스 삭제
DROP INDEX index_lastname_gender ON employees

-- type 확인 (인덱스 생성 전/후)
EXPLAIN
SELECT * FROM employees WHERE last_name = 'Smith' AND gender ='M'

