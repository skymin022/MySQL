-- Active: 1745889744480@@127.0.0.1@3306@aloha
-- 계정 생성
CREATE USER 'test'@'localhost' IDENTIFIED BY '123456';

-- 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' WITH GRANT OPTION;

-- 스키마(데이터베이스) 생성 / 예약어로 테이블 명을 지정할 시 ``을 사용(뺵틱)
-- - 식별자가 키워드(예약어)와 같은 경우 `이름`형태로 정의할 수 있다.
CREATE DATABASE `test`;

-- 테이블 생성
-- VARCHAR(바이트 수) : 변화가 있는 문자열 타입(사용 용량이 적을 시 알아서 바이트 수를 줄여줌)
-- CHAR(바이트 수) : 바이트 수가 고정된 문자열 타입
-- TEXT : 장문(용량 제한이 없음)
-- NOT NULL : 빈 공간이 허용이 안됨
-- 기본 값이 NULL : 빈 공간 허용
-- TIMESTAMP : 날짜 시간값
-- CURRENT_TIMESTAMP : 현재 시간 값을 생성
DROP TABLE IF EXISTS `board`; -- if exists 존재 시에만 삭제
CREATE TABLE `board` (
    `no`        INT             AUTO_INCREMENT PRIMARY KEY     COMMENT '번호',
    `id`        VARCHAR(64)     UNIQUE                         COMMENT '아이디',
    `title`     VARCHAR(100)    NOT NULL                       COMMENT '제목',
    `writer`    VARCHAR(45)     NOT NULL                       COMMENT '작성자',
    `content`   TEXT            NULL                           COMMENT '내용',
    `create_at` TIMESTAMP       NOT NULL DEFAULT now()         COMMENT '등록일자',
    `update_at` TIMESTAMP       NOT NULL DEFAULT now()         COMMENT '수정일자'
    -- DB에서는 대소문자 구분이 없어서 스네이크 케이스(_); 언더스코어 케이스를 사용
    -- now 로 현재시간 가능
) COMMENT '게시판';

-- 데이터 추가(행)
INSERT INTO `board` ( no, id, title ,writer, content, create_at , update_at)
VALUES(1, UUID(), '제목01', '작성자01', '내용01', now(), now());
-- AUTO_INCREMENT, DEFAULT 적용된 컬럼은 생략하고 추가 가능
INSERT INTO `board` ( id, title ,writer, content)
VALUES( UUID(), '제목02', '작성자02', '내용02' );

-- 모든 컬럼 생략 시, 모든 값을 다 지정해야한다.
INSERT INTO `board`
VALUES(3, UUID(), '제목03', '작성자03', '내용03', now(), now());

--데이터 조회
SELECT *
FROM board;

SELECT *
FROM board
WHERE title = '제목01';

-- 등록 일자 기준 내림 차순(최신-> 오래)
SELECT *
FROM board
ORDER BY create_at DESC;

-- 등록 일자 기준 오름 차순(오래 -> 최신)
SELECT *
FROM board
ORDER BY create_at ASC;

-- 데이터 수정
UPDATE board
SET title = '수정',
    writer ='수정',
    content = '수정',
    update_at = now()
WHERE no = 1;

SELECT * FROM board;

-- 데이터 삭제 / 복원 가능
DELETE FROM board
WHERE no = 1;

SELECT * FROM board;

-- 테이블 수정
-- * 컬럼 추가
ALTER Table board ADD COLUMN `views` INT NOT NULL DEFAULT 0 COMMENT '조회수';

-- 컬럼 삭제
ALTER Table board DROP COLUMN `views`;

-- 확인
DESC board;

SELECT * FROM board;

-- 테이블 데이터 전체삭제
-- * 되돌리기 불가 (복원불가)
TRUNCATE Table board;


-- TCL 실습
-- 트랜잭션 시작
START TRANSACTION;

-- 게시글 데이터 추가 - 제목 001
INSERT INTO `board` ( id, title ,writer, content, create_at , update_at)
VALUES( UUID(), '제목001', '작성자01', '내용01', now(), now());
-- 잘못된 데이터 추가 - 잘못된 글
INSERT INTO `board` (  id, title ,writer, content, create_at , update_at)
VALUES( UUID(), '잘못된글', '잘못된글', '잘못된글', now(), now());

-- 데이터 입력 값 확인
SELECT * FROM board;

-- * ROLLBACK : 트랜잭션 수행 변경사항 취소
ROLLBACK;

-- 데이터 입력 값 확인
SELECT * FROM board;

START TRANSACTION;
-- 게시글 데이터 추가 - 제목 001
INSERT INTO `board` (  id, title ,writer, content, create_at , update_at)
VALUES( UUID(), '제목001', '작성자01', '내용01', now(), now());

-- *COMMIT : 트랜잭션 수행 변경사항 적용
COMMIT;

-- 데이터 입력 값 확인
SELECT * FROM board;