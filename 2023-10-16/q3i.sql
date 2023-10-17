-- a. List the names of all clients having 'a' as the second letter in their names.
SELECT c.name
FROM client_master c
WHERE c.name LIKE '_a%';

-- b. List the clients who stay in a city whose First letter is 'M'.
SELECT c.name
FROM client_master c
WHERE c.city LIKE 'M%';

-- c. List all clients who stay in 'Bangalore' or Mangalore'
SELECT c.name
FROM client_master c
WHERE c.city = 'Bangalore'
   OR c.city = 'Mangalore';

-- d. List all clients whose Bal_Due is greater than value 10000.
SELECT c.name
FROM client_master c
WHERE c.bal_due > 10000.00;

-- e. List all information from the Sales _Order table for orders placed in the month of June.
SELECT *
FROM sales_order s
WHERE EXTRACT(MONTH FROM s.order_date) = 6;

-- f. List the order information for Client_No 'C00001' and 'C00002'.
SELECT *
FROM sales_order so
WHERE so.client_no = 'C00001'
   OR so.client_no = 'C00002';

-- g. List products whose selling price is greater than 500 and less than or equal to 750.
SELECT p.description, p.sell_price
FROM product_master p
WHERE p.sell_price > 500
  AND p.sell_price <= 750;

-- h. List products whose selling price is more than 500.
-- Calculate a new selling price as, original selling price*1.5.
-- Rename the new column in the output of the above query as new_price.
SELECT p.description, p.sell_price, p.sell_price * 1.5 AS new_price
FROM product_master p
WHERE p.sell_price > 500;

-- i. List the names, city and state of clients who are not in the state of 'Maharashtra'.
SELECT c.name, c.city, c.state
FROM client_master c
WHERE c.state != 'Maharashtra';

-- j. Count the total number of orders.
SELECT COUNT(*) AS tot_ord
FROM sales_order s;

-- k. Calculate the average price of all the products.
SELECT ROUND(AVG(p.sell_price), 2) AS avg_sp
FROM product_master p;

-- l. Determine the maximum and minimum product prices. Rename the output as max_price and min_price respectively.
SELECT MAX(p.sell_price) AS max_price,
       MIN(p.sell_price) AS min_price
FROM product_master p;

-- m. Count the number of products having price less than or equal to 500.
SELECT COUNT(p.sell_price)
FROM product_master p
WHERE p.sell_price > 500;

-- n. List all the products whose Qty_On_Hand is less than reorder level.
SELECT *
FROM product_master p
WHERE p.qty_on_hand < p.reorder_lvl