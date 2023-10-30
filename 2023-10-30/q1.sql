-- 1. Write a PL/SQL program to print “HELLO WORLD”.
BEGIN
    DBMS_OUTPUT.put_line('HELLO WORLD');
END;

-- 2. Write a PL/SQL code for inverting a number. (Example: 1234 – 4321)
DECLARE
  	num NUMBER := 1234; 
  	rev NUMBER := 0;
  	d NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Original Number: ' || num);
  	WHILE num > 0 LOOP
    	d := num MOD 10; 
    	rev := rev * 10 + d;
    	num := FLOOR(num / 10); 
  	END LOOP;
  	DBMS_OUTPUT.PUT_LINE('Reversed Number: ' || rev);
END;

-- 3. Write a PL/SQL code to find the greatest number among three with Anonymous blocks.
DECLARE
  	num1 NUMBER := 10; -- Change the values as needed
  	num2 NUMBER := 20;
  	num3 NUMBER := 15;
  	greatest NUMBER;
BEGIN
  	greatest := num1; 
  	IF num2 > greatest THEN
    	greatest := num2;
  	END IF;
  	IF num3 > greatest THEN
    	greatest := num3;
  	END IF;
  	DBMS_OUTPUT.PUT_LINE('The greatest number is: ' || greatest);
END;

-- 4. Write a PL/SQL code to calculate the area of a circle where radius takes values from 3 to 7. Store the calculated area in Table AREA. The schema of table is given below: AREA (Radius, Area)
DECLARE
  	v_radius NUMBER;
  	v_area NUMBER;
BEGIN
  	FOR v_radius IN 3..7 LOOP
    	v_area := 3.14159265359 * v_radius * v_radius; 
		INSERT INTO AREA (Radius, Area) VALUES (v_radius, v_area);
  	END LOOP;
	COMMIT; 
END;

-- 5. Write a PL/SQL program to accept a number and find the factorial of the number
DECLARE
    num NUMBER := 5; 
    factorial NUMBER := 1;
BEGIN
  	FOR i IN 1..num LOOP
		factorial := factorial * i;
  	END LOOP;
  	DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is ' || factorial);
END;

-- 6. Write a PL/SQL program to display the months between two dates of a year.
DECLARE
  	start_date DATE := TO_DATE('01-JAN-2023', 'DD-MON-YYYY');
  	end_date DATE := TO_DATE('30-OCT-2023', 'DD-MON-YYYY'); 
  	current_date DATE := start_date;
BEGIN
  	WHILE current_date <= end_date LOOP
    	DBMS_OUTPUT.PUT_LINE(TO_CHAR(current_date, 'Month'));
    	current_date := ADD_MONTHS(current_date, 1);
  	END LOOP;
END;

-- 7. Create an Account_Master table & insert the tuples as given in the question. Write a PL/SQL code that will accept an account number from user. If the balance of account is less than minimum balance (i.e 1000), then deduct Rs 100 from balance.
DECLARE 
  	account_number NUMBER := 3; 
  	minimum_balance NUMBER := 1000; 
  	bal NUMBER; 
BEGIN 
  	SELECT balance AS bal
    FROM Acc_Master
  	IF bal < minimum_balance THEN 
    	bal := bal - 100; 
    	UPDATE Acc_Master 
        SET bal = bal 
        WHERE acct_no = account_number;
    	DBMS_OUTPUT.PUT_LINE('Deducted Rs 100 from the balance.'); 
    	COMMIT; 
  	ELSE 
    	DBMS_OUTPUT.PUT_LINE('Balance is sufficient.'); 
  	END IF; 
END; 

