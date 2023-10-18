-- a. Find the Product_No and description of non-moving products i.e. products not being sold.
SELECT pm.product_no, pm.description
FROM product_master pm
WHERE pm.product_no NOT IN(
    SELECT sod.product_no
    FROM sales_order_details sod
);

-- b. List the customer Name, Address1, Address2, City and PinCode for the client who has placed order no '019001'.
SELECT cm.name,
       cm.address1,
       cm.address2,
       cm.city,
       cm.pincode
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
WHERE so.order_no = 'O19001';

-- c. List the client names that have placed orders before the month of May, 02.
SELECT cm.name
FROM client_master cm
JOIN sales_order so
ON cm.client_no = so.client_no
WHERE so.order_date < '2004-05-01';

-- d. List if the product 'Lycra Top' has been ordered by any client and print the Client_no, Name to whom it was sold.
SELECT DISTINCT(cm.name),
       cm.client_no
FROM client_master cm
JOIN sales_order so
ON so.client_no = cm.client_no
JOIN sales_order_details sod
ON sod.order_no = so.order_no
JOIN product_master pm
ON sod.product_no = pm.product_no
WHERE pm.description = 'Lycra Top';

-- e. List the names of clients who have placed orders worth Rs. 10000 or more.
SELECT cm.name
FROM client_master cm
WHERE cm.client_no IN(
    SELECT so.client_no
    FROM sales_order so
    WHERE so.order_no IN(
        SELECT sod.order_no
        FROM sales_order_details sod
        WHERE (sod.qty_ordered * sod.product_rate) >= 10000
    )
);