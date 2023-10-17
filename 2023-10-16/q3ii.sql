-- a. List the order no. and day on which clients placed their order.
SELECT EXTRACT(DAY FROM so.order_date) AS ord_day, so.order_no
FROM sales_order so;

-- b. List the month (in alphabets) and date when the orders must be delivered.
SELECT TO_CHAR(so.dely_date, 'MONTH') AS ord_mon,
       EXTRACT(DAY FROM so.dely_date) AS ord_day
FROM sales_order so;

-- c. List the Order _Date in the format 'DD-Month-YY'. E.g. 12-February-02.
SELECT TO_CHAR(so.dely_date, 'DD-MONTH-YY') AS ord_date
FROM sales_order so;

-- d. List the date, 15 days after today's date.
SELECT DATEADD(DAY, 15, CURRENT_TIMESTAMP);