-- (a) Retrieve the list of names and the cities of all the clients.
SELECT c_name, c_cty
from client;

-- (b) List the various products available.
SELECT *
from product;

-- (c) Find the names of all clients having ‘a’ as the second letter in their names.
SELECT c_name
from client
WHERE c_name LIKE '_a%';

-- (d) List all the clients who are located in Allahabad.
SELECT c_name
from client
WHERE c_cty = 'tezpur';

-- (e) Find the products whose selling price is greater than 2000 and less than or equal to 5000
SELECT p_name
FROM product
WHERE price > 2000
  AND price < 5000;

-- (f) Add a new column NEW_PRICE into the produc table.
ALTER TABLE sales_info
    RENAME COLUMN p_rate
    TO new_p_rate;

-- (g) Rename the column P_rate of Sales_Order_Details to new_P_rate.
ALTER TABLE product
    ADD(new_price DECIMAL);

-- (h) List the products in sorted order of their description.
SELECT *
FROM product
ORDER BY p_desc;

-- (i) Display the order number and date on which the clients placed their order.
SELECT ord_no, ord_date
FROM sales_info;

-- (j) Delete all the records having delivery date before 25th August, 2018.
DELETE
FROM sales_info
WHERE dlvry_date < '25/08/2008';

-- (k) Change the delivery date of order number ON01008 to 16-08-18
UPDATE sales_info
SET dlvry_date = '16/08/08'
WHERE ord_no = '1008';

-- (l) Change the bal_due of client_no C01003 to 1200
UPDATE client
SET bal_due = '1200'
WHERE c_id = '1003';

-- (m)Find the product with description as ‘HDD1034’ and ‘DVDRW’
SELECT *
FROM product
where p_desc = 'HDD1034'
   OR p_desc = 'DVDRW';

-- (n) List the names, city and state of the clients not in the state of ‘ASSAM’
SELECT c_name, c_cty, c_state
FROM client
WHERE NOT c_state = 'assam';

-- (o) List of all orders that were cancelled in the month of March.
Select *
FROM sales_info
WHERE TO_CHAR(cncl_date, 'mm') = '03';
