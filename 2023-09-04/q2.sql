-- 1. Display product information which are ordered in the same year of its manufacturing year.
SELECT * 
FROM products
JOIN sales 
ON sales.ord_id = products.ord_id
WHERE TO_CHAR(products.mfg_date, 'yyyy') = TO_CHAR(sales.ord_date, 'yyyy');

-- 2. Display product information which are ordered in the same year of its manufacturing year where vendor is “smith‟.
SELECT * 
FROM products
JOIN sales 
ON sales.ord_id = products.ord_id
WHERE TO_CHAR(products.mfg_date, 'yyyy') = TO_CHAR(sales.ord_date, 'yyyy') 
AND sales.client = 'Smith';

-- 3. Display total no. of orders placed in each year.
SELECT COUNT(sales.ord_date), EXTRACT(YEAR FROM sales.ord_date)
FROM sales
GROUP BY 
EXTRACT(
    YEAR 
    FROM sales.ord_date
);

-- 4. Display total no. of orders placed in each year by vendor Wills.
SELECT COUNT(sales.ord_date) AS order_count, 
EXTRACT(YEAR FROM sales.ord_date) AS order_year
FROM sales
WHERE sales.client = 'Wills'
GROUP BY EXTRACT(
	YEAR 
	FROM sales.ord_date
);

-- 5. Display the name of all those persons who are vendors and customers both.
SELECT DISTINCT(vnd_name)
FROM vendors
JOIN sales 
ON sales.client = vendors.vnd_name

-- 6. Display total no. of food items ordered every year.
SELECT p.material AS food, 
SUM(s.qnty) AS orders
FROM products p
JOIN sales s
ON s.ord_id = p.ord_id
WHERE p.material = 'BREAD' 
GROUP BY p.material

-- 7. Display total no. of food items ordered every year made from Bread.
SELECT p.material AS food, 
SUM(s.qnty) AS orders,
EXTRACT(YEAR FROM s.ord_date) AS order_year
FROM products p
JOIN sales s
ON s.ord_id = p.ord_id
WHERE p.material = 'BREAD' 
GROUP BY p.material, EXTRACT(YEAR FROM s.ord_date);

-- 8. Display list of product_id whose vendor and customer is different.
SELECT DISTINCT p.prod_id
FROM products p
JOIN sales s 
ON p.ord_id = s.ord_id
JOIN vnd_info v 
ON p.vnd_id = v.vnd_id
WHERE s.client != v.vnd_name;

-- 9. Display all those customers who are ordering products of milk by smith.
SELECT DISTINCT s.client
FROM sales s
JOIN products p 
ON s.ord_id = p.ord_id
JOIN vnd_info v 
ON p.vnd_id = v.vnd_id
WHERE v.vnd_name = 'Smith' 
AND p.material = 'MILK';

-- 10. Display total no. of orders by each vendor every year.
SELECT SUM(s.qnty) AS total_sales, 
EXTRACT (YEAR FROM s.ord_date) AS order_year,
v.vnd_name 
FROM sales s
JOIN products p
ON s.ord_id = p.ord_id
JOIN vnd_info v
ON v.vnd_id = p.vnd_id
GROUP BY v.vnd_name, 
EXTRACT (YEAR FROM s.ord_date)
ORDER BY 
EXTRACT (YEAR FROM s.ord_date) DESC
