use aloha;

-- 사원번호, 사원명, 부서명
-- 부서가 없는 직원
SELECT emp.emp_no
        ,emp.name
        ,dept.dept_name
FROM employees emp
    LEFT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;

-- 사원번호, 사원명, 부서명
-- 직원이 없는 부서도 표시
SELECT emp.emp_no
        ,emp.name
        ,dept.dept_name
FROM employees emp
    RIGHT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;

-- 사원번호, 사원명, 부서명
-- 직원이 없는 부서도 표시 + 부서가 없는 직원
-- *FULL JOIN은 MySQL에서는 직접 지원하지 않는다.
SELECT emp.emp_no
        ,emp.name
        ,dept.dept_name
FROM employees emp
    LEFT JOIN departments dept
    ON emp.dept_no = dept.dept_no
    UNION
SELECT emp.emp_no
        ,emp.name
        ,dept.dept_name
FROM employees emp
    RIGHT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;