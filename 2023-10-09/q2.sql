CREATE TABLE customer (
    cid SMALLINT PRIMARY KEY, 
    cname VARCHAR(50), 
    city VARCHAR(50), 
    grade SMALLINT, 
    sid SMALLINT REFERENCES slsman(sid)
);

CREATE TABLE slsman (
    sid SMALLINT PRIMARY KEY, 
    sname VARCHAR(50), 
    city VARCHAR(50), 
    commission DECIMAL(4,2)
);

CREATE TABLE orders (
    ono SMALLINT PRIMARY KEY, 
    price DECIMAL(6,2), 
    odate DATE, 
    cid SMALLINT REFERENCES customer(cid), 
    sid SMALLINT REFERENCES slsman(sid)
);

CREATE TABLE eliteslsman (
    sid SMALLINT PRIMARY KEY, 
    esname VARCHAR(50), 
    city VARCHAR(50), 
    commission DECIMAL(4,2)
);

Insert into client values(‘cn01001’,’alak roy’,’ b.d.para’,’amarpur’,’799101’,’tripura’,’390.9’);
Insert into client values(‘cn01002’,’suman roy’,’ puk para’,’agartala’,’799102’,’tripura’,’2390.9’);
Insert into client values(‘cn01004’,’priya das’,’ chora para’,’kamalpur’,’799301’,’tripura’,’1390.9’);
Insert into client values(‘cn01005’,’mita mia’,’ kamal para’,’singur’,’799721’,’tripura’,’190.9’);
Insert into client values(‘cn01006’,’pulak roy’,’ bircity’,’sonitpur’,’799141’,’assam’,’110.9’);
Insert into client values(‘cn01007’,’munni das’,’ nappam’,’sonitpur’,’799152’,’assam’,’190.9’);
Insert into client values(‘cn01008’,’kusum roy’,’ city_dos’,’tezpur’,’799141’,’assam’,’110.9’);
Insert into client values(‘cn01009’,’mina das’,’ pachmile’,’tezpur’,’799152’,’assam’,’190.9’);
Insert into client values(‘cn01003’,’moytree nayak’,’ pachmile’,’tezpur’,’799152’,’assam’,’9990.9’);
Insert into client values(‘cn01010’,’pauri mia’,’ pachmile’,’tezpur’,’799152’,’assam’,’2990.9’);
Insert into client values(‘cn01011’,’manali das’,’ satmile’,’tezpur’,’799154’,’assam’,’3990.9’);

Insert into salesman values(‘s002’,’Rohan das’,’nappam’,’Tezpur’,’799170’,’Assam’,’8000’);
Insert into salesman values(‘s003’,’Smita das’,’nirjuli’,’itanagar’,’799701’,’Arunachal’,’9000’);
Insert into salesman values(‘s004’,’Kabir bora’,’nappam’,’Tezpur’,’799703’,’Assam’,’8500’);
Insert into salesman values(‘s005’,’Neha singh’,’borbota ’,’sonitpur’,’795970’,’assam’,’9600’);
Insert into salesman values(‘s006’,’Priya agarwal’,’gandhi road ’,’32 distric’,’799750’,’delhi’,’9900’);
Insert into salesman values(‘s007’,’Ashok Paul’,’filmcity’,’munnabari ’,’799740’,’mumbai’,’8900’);

Insert into sales_order_details values(‘on01001’,’01-aug-2008’,’cn01001’,’s001’,’yes’,’20-aug-2008’,
’2220.40’,’50’,’’);
Insert into sales_order_details values(‘on01002’,’12-aug-2008’,’cn01004’,’s001’, ’yes’,’23-aug-2008’,
’2220.40’,’15’.’’);
Insert into sales_order_details values(‘on01003’,’12-aug-2008’,’cn01005’,’s003’, ’yes’,’26-aug-2008’,
’2220.40’,’10’,’’);
Insert into sales_order_details values(‘on01004’,’13-aug-2008’,’cn01004’,’s001’, ’yes’,’20-aug-2008’,
’2220.40’,’15’,’’);
Insert into sales_order_details values(‘on01005’,’14-aug-2008’,’cn01002’,’s002’, ’no’,’30-aug-2008’,
’2220.40’,’52’, ’28-march-2008’);
Insert into sales_order_details values(‘on01006’,’15-aug-2008’,’cn01001’,’s001’, ’yes’,’31-aug-2008’,
’2220.40’,’53’,’’);
Insert into sales_order_details values(‘on01007’,’16-jan-2008’,’cn01003’,’s004’, ’yes’,’28-aug-2008’,
’2220.40’,’54’,’’);
Insert into sales_order_details values(‘on01008’,’01-feb-2008’,’cn01004’,’s003’, ’no’,’28-aug-2008’,
’8220.40’,’54’, ’18-march-2008’);

-- a) Create a view for those salesmen who belong to the city ‘New York’.
-- b) Create a view for all salesmen with columns salesman_id, name and city.
-- c) Find the salesmen of the city New York who achieved the commission more than 13%.
-- d) Create a view to getting a count of how many customers we have at each level of a grade.
-- e) Create a view to keeping track the number of customers ordering, number of salesmen attached, average amount of orders and the total amount of orders in a day.
-- f) Create a view that shows for each order the salesman and customer by name.
-- g) Create a view that finds the salesman who has the customer with the highest order of a day.
-- h) Create a view that finds the salesman who has the customer with the highest order at least 3 times on a day.
-- i) Create a view that shows all of the customers who have the highest grade.
-- j) Create a view that shows the number of the salesman in each city.
-- k) Create a view that shows the average and total orders for each salesman after his or her name. (Assume all names are unique)
-- l) Create a view that shows each salesman with more than one customers.
-- m) Create a view that shows all matches of customers with salesman such that at least one customer in the city of customer served by a salesman in the city of the salesman.
-- n) Create a view that shows the number of orders in each day
-- o) Create a view that finds the salesmen who issued orders on October 10th, 2012.
-- p) Create a view that finds the salesmen who issued orders on either August 17th, 2012 or October 10th, 2012.