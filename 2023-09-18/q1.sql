--a
SELECT fname
FROM emp AS E_Name;

--b
SELECT UPPER(emp.lname)
FROM emp;

--c
SELECT LEFT(emp.fname, 3)
FROM emp;

--d
SELECT DISTINCT(emp.dept), LENGTH(emp.dept)
FROM emp;

--e
SELECT REPLACE(emp.fname, 'a', 'A')
FROM emp;

--f
SELECT *
FROM emp
ORDER BY fname ASC, dept DESC;

--g
SELECT *
FROM emp
WHERE emp.fname LIKE '_____h';

--h
SELECT *
FROM emp
WHERE EXTRACT(MONTH FROM emp.join_date) = 2
  AND EXTRACT(YEAR FROM emp.join_date) = 2014;

--i
SELECT fname, lname
FROM emp
WHERE sal >= 50000.00
  AND sal < 100000.00;

--j 
SELECT COUNT(*), dept
FROM emp
GROUP BY dept
ORDER BY COUNT(*) DESC;

--k
SELECT *
FROM emp
         JOIN jobtitle
              ON jobtitle.e_ref_id = emp.emp_id
WHERE jobtitle.title = 'Manager';

--l
SELECT title, since, COUNT(*)
FROM jobtitle
GROUP BY title, since
HAVING COUNT(*) > 1;

--m
SELECT *
FROM emp E
         JOIN bonus B
              ON E.emp_id = B.e_ref_id;

--n
SELECT DISTINCT sal
FROM emp
ORDER BY sal DESC
LIMIT 1 OFFSET 4;

--o
SELECT sal
FROM emp E1
WHERE 4 = (SELECT COUNT(DISTINCT sal)
           FROM emp E2
           WHERE E1.sal <= E2.sal);

--p
SELECT *
FROM emp e1
         JOIN emp e2
              ON e1.sal = e2.sal AND e1.emp_id != e2.emp_id;

--q
SELECT DISTINCT sal
FROM emp
ORDER BY sal DESC
LIMIT 1 OFFSET 1;

--r
SELECT count(*), dept
FROM emp
GROUP BY dept
ORDER BY count(*) DESC;

--s
SELECT concat(fname, ' ', lname) AS Name, sal, dept
FROM emp e
WHERE e.sal
          IN (SELECT max(sal)
              FROM emp
              GROUP BY dept);

--t
SELECT DISTINCT sal
FROM emp
ORDER BY sal ASC
LIMIT 3;

--u
SELECT sum(sal) AS tot_sal, dept
FROM emp
GROUP BY dept
ORDER BY sum(sal) DESC;

--v
SELECT concat(fname, ' ', lname) AS Name, sal
FROM emp e
WHERE e.sal
          IN (SELECT max(sal)
              FROM emp);
