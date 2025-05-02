-- 게시판 테이블 생성
DROP TABLE IF EXISTS board;

CREATE TABLE board (
    no INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS reply;
CREATE TABLE reply (
    no INT AUTO_INCREMENT PRIMARY KEY,
    board_no INT,
    content TEXT,
    Foreign Key (board_no) REFERENCES board(no)
    -- ON UPDATE CASCADE -- 부모가 변경 시 -> 자식도 변경 O
    -- ON DELETE CASCADE -- 부모가 변경 시 -> 자식도 변경 O
    -- ON UPDATE SET NULL -- 부모가 변경 시 -> 자식 변경 X
    -- ON DELETE SET NULL -- 부모가 변경 시 -> 자식 변경 X
    -- ON UPDATE NO ACTION -- 부모가 변경 시 -> 자식 변경 X
    -- ON DELETE NO ACTION -- 부모가 변경 시 -> 자식 변경 X
    ON UPDATE RESTRICT -- 부모가 변경 시 -> 부모 삭제 불가
    ON DELETE RESTRICT -- 부모가 변경 시 -> 부모 삭제 불가

);

INSERT INTO board (title)
VALUES
    ('제목1'),
    ('제목2'),
    ('제목3'),
    ('제목4'),
    ('제목5')
    ;

INSERT INTO reply (board_no, content)
VALUES
    (2, '댓글내용1'),
    (2, '댓글내용2'),
    (2, '댓글내용3')
    ;

SELECT *
    FROM board;

SELECT *
FROM reply;

UPDATE board
SET no = 10
WHERE no = 1;

DELETE FROM board
WHERE no = 2;