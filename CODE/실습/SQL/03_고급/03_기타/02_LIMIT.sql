-- LIMIT

USE ALOHA;
-- 맨 앞에서 부터 10개
SELECT *
FROM board
LIMIT 10

/*
    LIMIT 키워드 문법 순서

    SELECT *
    FROM 테이블
    WHERE
    GROUP BY
    ORDER BY
    LIMIT
    * 제일 마지막에 적어준다
*/

-- 페이지당 10개의 게시글
-- 12 페이지를 출력하시오
SELECT *
FROM board
LIMIT 110, 10;

SELECT *
FROM board
LIMIT 110 OFFSET 10;

-- 페이징당 20
-- 36 페이지를 출력하시오
SELECT *
FROM board
LIMIT 700, 20;