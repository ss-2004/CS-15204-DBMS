
-- 1 Display the names and contact number of all student member
SELECT f_name, phno 
FROM stud_member;

-- 2 Give the names and roll numbers of all students of information technology who are the members
SELECT f_name, roll_no 
FROM stud_member sm 
JOIN dept 
ON dept.dept_id = sm.dept_id 
WHERE dept_name="IT";

-- 3 Display the names of department whose students are members
SELECT DISTINCT dept_name 
FROM dept 
JOIN stud_member sm 
ON dept.dept_id = sm.dept_id
WHERE dept.dept_id IN ( 
    SELECT dept_id 
    FROM stud_member 
);

-- 4 Display the names of departments for which no student are the members
SELECT DISTINCT dept_name 
FROM dept 
JOIN stud_member sm 
ON dept.dept_id != sm.dept_id 
WHERE dept.dept_id NOT IN ( 
    SELECT dept_id 
    FROM stud_member 
);

-- 5 Display the names of all departments
SELECT dept_name 
FROM dept;

-- 6 Find the names of students of electrical department who are the members
SELECT DISTINCT f_name 
FROM stud_member sm 
JOIN dept d 
ON d.dept_id = sm.dept_id 
WHERE d.dept_name = "EE";

-- 7 Display the information of students members whose names begin with the letter A
SELECT * 
FROM stud_member 
WHERE f_name 
LIKE "A%";

-- 8 Display all the details of male members only
SELECT * 
FROM stud_member 
WHERE sex = "M";

-- 9 Display the data of student members who are currently in semester 3
SELECT * 
FROM stud_member 
WHERE sem = "3";

-- 10 Display the data of student female member in alphabetic order
SELECT * 
FROM stud_member 
WHERE sex = "F" 
ORDER BY f_name ASC;
