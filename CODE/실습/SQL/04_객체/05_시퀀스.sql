-- -- 시퀀스 생성
-- CREATE SEQUENCE `SEQ_STUNO`
--     START WITH 1        -- 시작값
--     INCREMENT BY 1      -- 증가값
--     MINVALUE 1         -- 최소값
--     MAXVALUE 999999    -- 최대값
--     CACHE 20           -- 캐시 크기
--     CYCLE;             -- 순환 여부
--     ;

-- -- 시퀀스 수정
-- ALTER SEQUENCE `SEQ_STUNO`
--     INCREMENT BY 2      -- 증가값 변경
--     MAXVALUE 1000000   -- 최대값 변경
--     CACHE 30;          -- 캐시 크기 변경

-- -- 시퀀스 삭제
-- DROP SEQUENCE `SEQ_STUNO`;

-- * MySQL에서는 SEQUENCE 직접 지원 안됨
-- * AUTO_INCREMENT로 간접적으로 사용
-- * MariaDB 10.3 버전 부터 SEQUENCE 적용됨

CREATE TABLE test (
    no BIGINT AUTO_INCREMENT PRIMARY KEY
);

-- 간접적으로 시퀀스 사용
CREATE Table student(
    stu_no  BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE seq_stuno (
    no BIGINT PRIMARY KEY
);

-- 시퀀스 증가
INSERT INTO seq_stuno VALUES(1);
-- 다음 스퀀스 증가
UPDATE seq_stuno SET no = no + 1;
SELECT no FROM seq_stuno;

