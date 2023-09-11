--1
SELECT c_name, c_cty
from client;
--2
SELECT *
from product;
--3
SELECT c_name
from client
WHERE c_name LIKE '_a%';
--4
SELECT c_name
from client
WHERE c_cty = 'tezpur';
--5
SELECT p_name
FROM product
WHERE price > 2000
  AND price < 5000;
--6
ALTER TABLE sales_info
    RENAME COLUMN p_rate
    TO new_p_rate;
--7
ALTER TABLE product
    ADD(new_price DECIMAL);
--8
SELECT *
FROM product
ORDER BY p_desc;
--9
SELECT ord_no, ord_date
FROM sales_info;
--10
DELETE
FROM sales_info
WHERE dlvry_date < '25/08/2008';
--11
UPDATE sales_info
SET dlvry_date = '16/08/08'
WHERE ord_no = '1008';
--12
UPDATE client
SET bal_due = '1200'
WHERE c_id = '1003';
--13
SELECT *
FROM product
where p_desc = 'HDD1034'
   OR p_desc = 'DVDRW';
--14
SELECT c_name, c_cty, c_state
FROM client
WHERE NOT c_state = 'assam';
--15
Select *
FROM sales_info
WHERE TO_CHAR(cncl_date, 'mm') = '03';
