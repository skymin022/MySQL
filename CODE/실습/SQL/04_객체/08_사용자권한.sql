-- 사용자 생성 및 권한 부여
-- 사용자 생성
    CREATE USER 'joeun'@'%' IDENTIFIED BY '123456';
    -- DROP USER 'joeun'@'%';
-- SELECT user, host FROM mysql.user WHERE user = 'joeun';

-- 특정 데이터베이스에 대한 모든 권한 부여
GRANT ALL PRIVILEGES ON joeun.* TO 'joeun'@'%';
REVOKE ALL PRIVILEGES ON *.* FROM 'joeun'@'%';

-- 특정 테이블에 대한 읽기 권한만 부여
GRANT SELECT ON joeun.* TO 'joeun'@'%';
REVOKE SELECT ON *.* FROM 'joeun'@'%';

-- 생성 권한 부여
GRANT CREATE ON *.* TO 'joeun'@'%';
