-- a. Print the description and total qty sold for each product.
SELECT pm.description, SUM(s.qty_ordered) AS tot_sold
FROM sales_order_details s
JOIN product_master pm
ON pm.product_no = s.product_no
GROUP BY pm.description
ORDER BY tot_sold;

-- b. Find the value of each product sold.
SELECT pm.description, SUM(s.qty_ordered*s.product_rate) AS tot_val
FROM sales_order_details s
JOIN product_master pm
ON pm.product_no = s.product_no
GROUP BY pm.description
ORDER BY tot_val;

-- c. Calculate the average qty sold for each client that has a maximum order value of 15000.00.
SELECT ROUND(AVG(sod.qty_ordered),2) AS avg_qty
FROM sales_order_details sod
JOIN sales_order so
ON so.order_no = sod.order_no
WHERE sod.qty_ordered*sod.product_rate <= 15000
GROUP BY so.client_no
ORDER BY avg_qty;

-- d. Find out the total of all the billed orders for the month of June.
SELECT SUM(s.qty_ordered*s.product_rate) AS tot_bill_june
FROM sales_order_details s
JOIN sales_order so
ON so.order_no = s.order_no
WHERE EXTRACT(MONTH FROM so.order_date) = 6

