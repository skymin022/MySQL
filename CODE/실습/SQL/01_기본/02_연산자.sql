-- Active: 1745889744480@@127.0.0.1@3306@employees
-- employees 스키마
/*
    연산자
    - 산술 연산자 : +, -, *, /, %
    - 비교 연산자 : =, !=, <>, >, <, <=, >=
    - 논리 연산자 :
        * BETWEEN A AND B
        * NOT
        * IN
        * LIKE
        * IS NULL
        * AND
        * ON
        * UNION, UNION ALL
*/

-- 연봉에 1000 달러를 더해서 출력
SELECT emp_no, salary, salary + 1000 AS '인상된 연봉'
FROM salaries;

-- 연봉에 2배
SELECT emp_no, salary, salary * 2 AS '인상된 연봉'
FROM salaries;

-- 월급을 조회하시오
SELECT emp_no, salary, salary / 12 AS '월급 추정'
FROM salaries;

-- 기부금
SELECT emp_no, salary, salary % 10000 AS '기부금'
FROM salaries;

-- 비교 연산자
SELECT *
FROM employees;

-- 1990 년 이후 입사한 사원 조회
SELECT *
FROM employees
WHERE hire_date > '1990-01-01';

-- 이름이 Marko 인 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name = 'Marko';

-- 이름이 Marko가 아닌 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name != 'Marko';

SELECT *
FROM employees
WHERE first_name <> 'Marko';

-- 연봉 테이블의 연봉이 50000 달러 이하인, 사원번호와 연봉 조회
SELECT emp_no, salary
FROM salaries
WHERE salary <= 50000;

-- 1995년 이후 입사하고 생년월일이 1960년 미만인 사원을 조회하시오
SELECT *
FROM employees
WHERE hire_date >= '1995-01-01'
    AND birth_date < '1960-01-01';

-- 성별이 남성인 사원들과 이름이 first_name이 Dante 인 사원을 조회하시오
SELECT *
FROM employees
WHERE gender ='M'
    OR first_name ='Dante';

-- 부서이력 테이블에서 부서번호가 'd001', 'd002', 'd003' 중 하나인 사원을 조회하시오
SELECT *
FROM dept_emp
WHERE dept_no in ('d001', 'd002', 'd003');

-- 부서 번호가 d005, d006이 아닌 데이터를 모두 조회하시오
SELECT *
FROM dept_emp
WHERE dept_no NOT IN ('d005', 'd006');

-- 부서가 없는 사원을 조회하시오
SELECT *
FROM dept_emp
WHERE dept_no IS NULL;

-- 부서이력 테이블에서 부서번호가 NULL 이 아닌 사원을 조회하시오
SELECT *
FROM dept_emp
WHERE dept_no IS NOT NULL;

-- 급여가 80000 달러 이상이거나 입사일이 1988년 이전인 사원 번호를 조회하시오
-- UNION : 두 쿼리를 합집합으로 조회(중복제외)
SELECT emp_no
FROM salaries
WHERE salary >= 80000
UNION
SELECT emp_no
FROM employees
WHERE hire_date < '1988-01-01';

-- UNION ALL: 두 쿼리를 합집합으로 조회(중복포함)
SELECT emp_no
FROM salaries
WHERE salary >= 80000
UNION ALL
SELECT emp_no
FROM employees
WHERE hire_date < '1988-01-01';

-- 연봉이 50000달러 이상 60000달러 이하인 사원 번호를 조회하시오
SELECT *
FROM salaries
WHERE salary >= 50000 AND salary <= 60000;

SELECT *
FROM salaries
WHERE salary BETWEEN 50000 AND 60000;

-- LIKE
-- _ : 한글자 대체
-- % : 공백 또는 한글자 이상 대체

-- 성이 B로 시작하고 이름이 5글자인 사원을 조회하시오
SELECT *
FROM employees
WHERE last_name LIKE 'B____';

-- 이름이 M으로 시작하는 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name LIKE 'M%';

-- 이름이 s으로 끝나는 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name LIKE '%s';

-- 이름이 i가 들어가는 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name LIKE '%i%';

-- 이름이 s으로 끝나지 않는 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name NOT LIKE '%s';