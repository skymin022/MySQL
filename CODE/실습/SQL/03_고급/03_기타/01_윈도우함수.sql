-- Active: 1745889744480@@127.0.0.1@3306@aloha
-- ROW NUMBER()
SELECT emp_no
			,name
			,dept_no
			,salary
			,ROW_NUMBER() OVER (
					PARTITION BY dept_no
					ORDER BY salary DESC
			) AS '부서별 급여 순번'
FROM employees;

SELECT ROW_NUMBER() OVER (ORDER BY emp_no) as '전체순번'
    ,name
FROM employees;

-- RANK()
SELECT emp_no
			,name
			,dept_no
			,salary
			,RANK() OVER (
					PARTITION BY dept_no
					ORDER BY salary DESC
			) AS '부서별 급여 순위'
FROM employees;

--DENSE_RANK
SELECT emp_no
			,name
			,dept_no
			,salary
			,DENSE_RANK() OVER (
					PARTITION BY dept_no
					ORDER BY salary DESC
			) AS '부서별 급여 순위'
FROM employees;

--NTILE
SELECT emp_no
			,name
			,salary
			,NTILE(4) OVER (
			ORDER BY salary DESC
			) AS '급여 분위'
FROM employees;

--LAG
SELECT emp_no
			,name
			,salary
			,LAG( salary, 1, 0) OVER (
			ORDER BY emp_no
			) AS '1행 이전 사원 급여'
FROM employees;

--LEAD
SELECT emp_no
			,name
			,salary
			,LEAD( salary, 1, 0) OVER (
			ORDER BY emp_no
			) AS '1행 이전 사원 급여'
FROM employees;

--FIRST_VALUE
SELECT emp_no
			,name
			,salary
            ,dept_no
			,FIRST_VALUE( salary) OVER (
			PARTITION BY dept_no
			ORDER BY emp_no
			) AS ' 첫번째 사원의 급여'
FROM employees;

--LAST_VALUE
SELECT emp_no
			,name
			,salary
            ,dept_no
			,LAST_VALUE( salary) OVER (
			PARTITION BY dept_no
			ORDER BY emp_no
			ROWS BETWEEN 3 PRECEDING
            AND
            3 FOLLOWING
			) AS ' 마지막 사원의 급여'
FROM employees;

--SUM, AVG
SELECT emp_no
			,name
			,salary
            ,dept_no
			,SUM( salary) OVER (
			PARTITION BY dept_no
			ORDER BY salary ASC
			ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
			) AS '내 앞1칸 + 나 + 뒤1칸 값 합계'
			,AVG( salary) OVER (
			PARTITION BY dept_no
			ORDER BY salary ASC
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
			) AS '첫행 ~ 현재행 평균'
FROM employees;