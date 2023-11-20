-- 1) Print numbers 10...1 
DECLARE
    counter NUMBER := 10;
BEGIN
    WHILE counter >= 1 LOOP
        DBMS_OUTPUT.put_line(counter || ', ');
        counter := counter - 1;
    END LOOP;
END;

-- 2) Print sum of odd numbers and product of even numbers 1...50
DECLARE
	odd_sum NUMBER := 0;
	evn_pro NUMBER := 1;
BEGIN
	FOR i IN 1..50 LOOP
		IF MOD(i, 2) = 0 THEN
			evn_pro := evn_pro * i;
		ELSE
			odd_sum := odd_sum + i;
		END IF;
	END LOOP;
	DBMS_OUTPUT.put_line('ODD SUM = ' || odd_sum);
	DBMS_OUTPUT.put_line('EVEN PRODUCT = ' || evn_pro);
END;

-- 3) Print reverse of a word
DECLARE 
	rev VARCHAR(128);
    wrd VARCHAR(128) := 'hello';
BEGIN
	FOR i IN REVERSE 1..LENGTH(wrd) LOOP
		rev := rev || SUBSTR(wrd, i, 1);
	END LOOP;
	DBMS_OUTPUT.put_line('Reverse of "' || wrd || '" : ' || rev);
END;

-- 4) Swap two numbers using temp variable
DECLARE
	a NUMBER := 10;
	b NUMBER := 20;
	t NUMBER;
BEGIN
	DBMS_OUTPUT.put_line('Before Swapping : ');
    DBMS_OUTPUT.put_line('Var 1 : ' || a );
	DBMS_OUTPUT.put_line('Var 2 : ' || b );
	t := a;
	a := b;
	b := t;
	DBMS_OUTPUT.put_line('After Swapping : ');
	DBMS_OUTPUT.put_line('Var 1 : ' || a );
	DBMS_OUTPUT.put_line('Var 2 : ' || b );
END;

-- 5) Check if a particular day falls on weekend or not (SAT/SUN)
DECLARE
	today DATE := TO_DATE('2023-11-13', 'YYYY-MM-DD');
	day_name VARCHAR(10);
BEGIN
	SELECT TO_CHAR(today, 'DAY') 
    INTO day_name FROM DUAL;
	IF day_name = 'SATURDAY' 
    OR day_name = 'SUNDAY' THEN
		DBMS_OUTPUT.put_line(today || ' falls on a weekend');
	ELSE
		DBMS_OUTPUT.put_line(today || ' falls on a weekday');
	END IF;
END;

-- 6) Count employees in dept 50 and check if there are any vacancies
DECLARE
	emp_count NUMBER;
	vacancies NUMBER := 45;
BEGIN
	SELECT COUNT(*) 
    INTO emp_count 
    FROM employees 
    WHERE dept_id = 50;
	DBMS_OUTPUT.putline('Employee count : ' || emp_count);
	IF emp_count < vacancies THEN 
        DBMS_OUTPUT.put_line('There are vacancies in dpt 50');
	ELSE
		DBMS_OUTPUT.put_line('No vacancies in dpt 50');
	END IF;
END;

-- 7) Copy one table to another using PL/SQL
DECLARE
BEGIN
	INSERT INTO dst_table
	SELECT * FROM src_table;
	DBMS_OUTPUT.put_line('Table inserted successfully!');
END;

-- 8) Find gross salary if DA is 40%, TA is 10% and HRA is 20% of base salary
DECLARE
	sal NUMBER := 50000;
	DA NUMBER;
	TA NUMBER;
	HRA NUMBER;
	tot_sal NUMBER;
BEGIN
	DA := sal * 0.4;
	TA := sal * 0.1;
	HRA := sal * 0.2;
	tot_sal := sal + TA + DA + HRA;
	DBMS_OUTPUT.put_line('Gross Salary : ' || tot_sal);
END;