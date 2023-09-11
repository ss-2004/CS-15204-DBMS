--1
SELECT f_name, phno 
FROM stud_member;
--2
SELECT f_name, roll_no 
FROM stud_member sm 
JOIN dept 
ON dept.dept_id = sm.dept_id 
WHERE dept_name="IT";
--3
SELECT DISTINCT dept_name 
FROM dept 
JOIN stud_member sm 
ON dept.dept_id = sm.dept_id
WHERE dept.dept_id IN ( 
    SELECT dept_id 
    FROM stud_member 
);
--4
SELECT DISTINCT dept_name 
FROM dept 
JOIN stud_member sm 
ON dept.dept_id != sm.dept_id 
WHERE dept.dept_id NOT IN ( 
    SELECT dept_id 
    FROM stud_member 
);
--5
SELECT dept_name 
FROM dept;
--6
SELECT DISTINCT f_name 
FROM stud_member sm 
JOIN dept d 
ON d.dept_id = sm.dept_id 
WHERE d.dept_name = "EE";
--7
SELECT * 
FROM stud_member 
WHERE f_name 
LIKE "A%";
--8
SELECT * 
FROM stud_member 
WHERE sex = "M";
--9
SELECT * 
FROM stud_member 
WHERE sem = "3";
--10
SELECT * 
FROM stud_member 
WHERE sex = "F" 
ORDER BY f_name ASC;
