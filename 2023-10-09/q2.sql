-- a) Create a view for those salesmen who belong to the city ‘Tezpur’.
CREATE VIEW TezpurSalesmen AS
SELECT sid, sname, city
FROM slsman
WHERE city = 'Tezpur';

-- b) Create a view for all salesmen with columns salesman_id, name and city.
CREATE VIEW AllSalesmen AS
SELECT sid, sname, city
FROM slsman;

-- c) Find the salesmen of the city New York who achieved the commission more than 13%.
CREATE VIEW HighCommission AS
SELECT sid, sname, city
FROM slsman
WHERE city = 'Tezpur'
  AND commission > 13;

-- d) Create a view to getting a count of how many customers we have at each level of a grade.
CREATE VIEW CustomerGradeCount AS
SELECT grade, COUNT(*) AS customer_count
FROM customer
GROUP BY grade;

-- e) Create a view to keeping track the number of customers ordering, number of salesmen attached, average amount of orders and the total amount of orders in a day.
CREATE VIEW DailyOrderStats AS
SELECT odate,
       COUNT(DISTINCT cid) AS customers,
       COUNT(DISTINCT sid) AS salesmen,
       AVG(price)          AS avg_purchase,
       SUM(price)          AS total_purchase
FROM orders
GROUP BY odate;

-- f) Create a view that shows for each order the salesman and customer by name.
CREATE VIEW SalesmanCustomerNames AS
SELECT O.ono,
       S.sname AS salesman_name,
       C.cname AS customer_name
FROM ORDERS O
         JOIN slsman S ON O.sid = S.sid
         JOIN customer C ON O.cid = C.cid;

-- g) Create a view that finds the salesman who has the customer with the highest order of a day.
CREATE VIEW SalesmanWithHighestOrder AS
SELECT DISTINCT O.odate, O.sid AS salesman_id, C.cname AS customer_name, O.price AS highest_order
FROM orders O
         JOIN customer C ON O.cid = C.cid
WHERE (O.odate, O.price) IN (SELECT odate, MAX(price) AS highest_amt
                             FROM orders
                             GROUP BY odate);

-- h) Create a view that finds the salesman who has the customer with the highest order at least 3 times on a day.
CREATE VIEW SalesmanWithHighOrderFrequency AS
SELECT O.odate, O.sid AS salesman_id, C.cid AS customer_id, COUNT(*) AS order_count
FROM orders O
         JOIN customer C ON O.cid = C.cid
GROUP BY O.odate, O.sid, C.cid
HAVING COUNT(*) >= 3;

-- i) Create a view that shows all of the customers who have the highest grade.
CREATE VIEW CustomersWithHighestGrade AS
SELECT cid, cname, grade
FROM customer
WHERE grade = (SELECT MAX(grade) FROM customer);

-- j) Create a view that shows the number of the salesman in each city.
CREATE VIEW SalesmenCountByCity AS
SELECT city, COUNT(*) AS salesman_count
FROM slsman
GROUP BY city;

-- k) Create a view that shows the average and total orders for each salesman after his or her name. (Assume all names are unique)
CREATE VIEW SalesmanOrderStats AS
SELECT S.sid, S.sname, AVG(O.price) AS avg_order_amt, SUM(O.price) AS total_order_amt
FROM slsman S
         LEFT JOIN ORDERS O ON S.sid = O.sid
GROUP BY S.sid, S.sname;

-- l) Create a view that shows each salesman with more than one customers.
CREATE VIEW SalesmanWithMultipleCustomers AS
SELECT S.sid, S.sname
FROM slsman S
         JOIN CUSTOMER C ON S.sid = C.sid
GROUP BY S.sid, S.sname
HAVING COUNT(C.cid) > 1;

-- m) Create a view that shows all matches of customers with salesman such that at least one customer in the city of customer served by a salesman in the city of the salesman.
CREATE VIEW CustomerSalesmanCityMatch AS
SELECT C.cid,
       C.cname AS customer_name,
       C.city  AS customer_city,
       S.sid,
       S.sname AS salesman_name,
       S.city  AS salesman_city
FROM CUSTOMER C
         JOIN slsman S ON C.city = S.city;

-- n) Create a view that shows the number of orders in each day
CREATE VIEW OrdersCountByDay AS
SELECT odate, COUNT(*) AS order_count
FROM orders
GROUP BY odate;

-- o) Create a view that finds the salesmen who issued orders on October 10th, 2012.
CREATE VIEW SalesmenOnOct10th2012 AS
SELECT DISTINCT s.sid, s.sname
FROM slsman s
         JOIN orders o ON s.sid = o.sid
WHERE o.odate = '2012-10-10';

-- p) Create a view that finds the salesmen who issued orders on either August 17th, 2012 or October 10th, 2012.
CREATE VIEW SalesmenOnSpecificDates AS
SELECT DISTINCT s.sid, s.sname
FROM slsman s
         JOIN orders o ON s.sid = o.sid
WHERE o.odate IN ('2012-08-17', '2012-10-10');
