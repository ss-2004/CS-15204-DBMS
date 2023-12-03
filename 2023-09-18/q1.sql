-- a) Fetch first name of worker using alias name as E_Name.
SELECT fname
FROM emp AS E_Name;

-- b) List the last name of employees in upper case.
SELECT UPPER(emp.lname)
FROM emp;

-- c) Retrieve the first three characters of employees from their first name.
SELECT LEFT(emp.fname, 3)
FROM emp;

-- d) Retrieve the unique values of department and display its length.
SELECT DISTINCT(emp.dept), LENGTH(emp.dept)
FROM emp;

-- e) List the first name from employees table after replacing ‘a’ with ‘A’.
SELECT REPLACE(emp.fname, 'a', 'A')
FROM emp;

-- f) Display all worker details, use order by in first name asec and department in desc.
SELECT *
FROM emp
ORDER BY fname ASC, dept DESC;

-- g) List the details of an employee whose first name ends with ‘h’ and contains six alphabets.
SELECT *
FROM emp
WHERE emp.fname LIKE '_____h';

-- h) Display the details of employees who have joined in Feb 2014.
SELECT *
FROM emp
WHERE EXTRACT(MONTH FROM emp.join_date) = 2
  AND EXTRACT(YEAR FROM emp.join_date) = 2014;

-- i) Fetch the employee’s names with salaries over and equal to 50000 and less than equal to 100000.
SELECT fname, lname
FROM emp
WHERE sal >= 50000.00
  AND sal < 100000.00;

-- j) List the no. of employees for each department in desc order.
SELECT COUNT(*), dept
FROM emp
GROUP BY dept
ORDER BY COUNT(*) DESC;

-- k) Print the details of employees who are also managers.
SELECT *
FROM emp
         JOIN jobtitle
              ON jobtitle.e_ref_id = emp.emp_id
WHERE jobtitle.title = 'Manager';

-- l) Fetch the duplicate records having matching data in some fields of a table.
SELECT title, since, COUNT(*)
FROM jobtitle
GROUP BY title, since
HAVING COUNT(*) > 1;

-- m) Fetch intersecting records of two tables.
SELECT *
FROM emp E
         JOIN bonus B
              ON E.emp_id = B.e_ref_id;

-- n) Find the nth (say n=5) highest salary from a table.
SELECT DISTINCT sal
FROM emp
ORDER BY sal DESC
LIMIT 1 OFFSET 4;

-- o) Find the 4th highest salary without using TOP or limit method.
SELECT sal
FROM emp E1
WHERE 4 = (SELECT COUNT(DISTINCT sal)
           FROM emp E2
           WHERE E1.sal <= E2.sal);

-- p) List the details of employees with the same salary.
SELECT *
FROM emp e1
         JOIN emp e2
              ON e1.sal = e2.sal AND e1.emp_id != e2.emp_id;

-- q) Display the second highest salary from a table.
SELECT DISTINCT sal
FROM emp
ORDER BY sal DESC
LIMIT 1 OFFSET 1;

-- r) Display all departments along with the number of people in there.
SELECT count(*), dept
FROM emp
GROUP BY dept
ORDER BY count(*) DESC;

-- s) List the name of employees having the highest salary in each department.
SELECT concat(fname, ' ', lname) AS Name, sal, dept
FROM emp e
WHERE e.sal
          IN (SELECT max(sal)
              FROM emp
              GROUP BY dept);

-- t) Fetch three min salaries from a table
SELECT DISTINCT sal
FROM emp
ORDER BY sal ASC
LIMIT 3;

-- u) Fetch departments along with the total salaries paid for each of them.
SELECT sum(sal) AS tot_sal, dept
FROM emp
GROUP BY dept
ORDER BY sum(sal) DESC;

-- v) Fetch the names of employees who earn the highest salary.
SELECT concat(fname, ' ', lname) AS Name, sal
FROM emp e
WHERE e.sal
          IN (SELECT max(sal)
              FROM emp);
