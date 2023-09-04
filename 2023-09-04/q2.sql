SELECT * 
FROM products
JOIN sales 
ON sales.ord_id = products.ord_id
WHERE TO_CHAR(products.mfg_date, 'yyyy') = TO_CHAR(sales.ord_date, 'yyyy');

SELECT * 
FROM products
JOIN sales 
ON sales.ord_id = products.ord_id
WHERE TO_CHAR(products.mfg_date, 'yyyy') = TO_CHAR(sales.ord_date, 'yyyy') 
AND sales.client = 'Smith';

SELECT COUNT(sales.ord_date), EXTRACT(YEAR FROM sales.ord_date)
FROM sales
GROUP BY 
EXTRACT(
    YEAR 
    FROM sales.ord_date
);

SELECT COUNT(sales.ord_date) AS order_count, 
EXTRACT(YEAR FROM sales.ord_date) AS order_year
FROM sales
WHERE sales.client = 'Wills'
GROUP BY EXTRACT(
	YEAR 
	FROM sales.ord_date
);

SELECT DISTINCT(vnd_name)
FROM vendors
JOIN sales 
ON sales.client = vendors.vnd_name

SELECT p.material AS food, 
SUM(s.qnty) AS orders
FROM products p
JOIN sales s
ON s.ord_id = p.ord_id
WHERE p.material = 'BREAD' 
GROUP BY p.material

SELECT p.material AS food, 
SUM(s.qnty) AS orders,
EXTRACT(YEAR FROM s.ord_date) AS order_year
FROM products p
JOIN sales s
ON s.ord_id = p.ord_id
WHERE p.material = 'BREAD' 
GROUP BY p.material, EXTRACT(YEAR FROM s.ord_date);

SELECT DISTINCT p.prod_id
FROM products p
JOIN sales s 
ON p.ord_id = s.ord_id
JOIN vnd_info v 
ON p.vnd_id = v.vnd_id
WHERE s.client != v.vnd_name;

SELECT DISTINCT s.client
FROM sales s
JOIN products p 
ON s.ord_id = p.ord_id
JOIN vnd_info v 
ON p.vnd_id = v.vnd_id
WHERE v.vnd_name = 'Smith' 
AND p.material = 'MILK';

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