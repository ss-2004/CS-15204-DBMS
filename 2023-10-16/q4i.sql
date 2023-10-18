-- a. Find out the products, which have been sold to "Ivan Bayross'.
SELECT DISTINCT(pm.description)
FROM product_master pm
JOIN sales_order_details sod
ON pm.product_no = sod.product_no
JOIN sales_order so
ON sod.order_no = so.order_no
JOIN client_master cm
ON cm.client_no = so.client_no
WHERE cm.name = 'Ivan Bayross';

-- b. Find out the products and their quantities that will have to be delivered in the current month.
SELECT pm.description, SUM(sod.qty_ordered)
FROM product_master pm
JOIN sales_order_details sod
ON pm.product_no = sod.product_no
JOIN public.sales_order so
ON sod.order_no = so.order_no
WHERE EXTRACT(MONTH FROM so.dely_date) = 7
GROUP BY pm.description;

-- c. List the Product_No. and description of constantly sold (i.e. rapidly moving) products.
SELECT DISTINCT(pm.description), pm.product_no
FROM sales_order_details sod,
     product_master pm
WHERE pm.product_no = sod.product_no;

-- d. Find the names of clients who have purchased 'Trousers'.
SELECT DISTINCT(cm.name)
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
JOIN sales_order_details sod
ON so.order_no = sod.order_no
JOIN product_master pm
ON sod.product_no = pm.product_no
WHERE pm.description = 'Trousers';

-- e. List the products and orders from customers who have ordered less than 5 units of 'Pull Overs'.
SELECT cm.name, SUM(sod.qty_ordered) AS ord_cnt
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
JOIN sales_order_details sod
ON so.order_no = sod.order_no
JOIN product_master pm
ON sod.product_no = pm.product_no
WHERE pm.description = 'Pull Overs'
GROUP BY cm.name
HAVING SUM(sod.qty_ordered) < 5;

-- f. Find the products and their quantities for the orders placed by 'Ivan Bayross' and 'Mamta Muzumdar'
SELECT cm.name, pm.description, SUM(sod.qty_ordered) AS ord_cnt
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
JOIN sales_order_details sod
ON so.order_no = sod.order_no
JOIN product_master pm
ON sod.product_no = pm.product_no
WHERE cm.name = 'Ivan Bayross'
OR cm.name = 'Mamta Muzumdar'
GROUP BY cm.name, pm.description;

-- g. Find the products and their quantities for the orders placed by Client No C00001' and C00002'.
SELECT cm.name, pm.description, SUM(sod.qty_ordered) AS ord_cnt
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
JOIN sales_order_details sod
ON so.order_no = sod.order_no
JOIN product_master pm
ON sod.product_no = pm.product_no
WHERE cm.client_no = 'C00001'
OR cm.client_no = 'C00002'
GROUP BY cm.name, pm.description;