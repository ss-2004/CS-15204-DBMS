-- a) Create a View called Client_View1 having all data of Client table
CREATE VIEW Client_View1 AS 
SELECT * 
FROM client;

-- b) Create a view called Client_vw2 having Client_ID , city and Bal_Due attributes of client table
CREATE VIEW Client_vw2 AS
SELECT cid, city, bal_due
FROM client;

-- c) Create a view called Client_vw3 with renaming Client_ID as CID , Client_Name as cname and Address as Addr of client table.
CREATE VIEW Client_vw3 AS
SELECT cid AS CID, cname AS cname, addr AS Addr
FROM client;

-- d) Using Client_view1, print client_name and Balance of Client whose ID is ‘cn01001’.
SELECT cname, bal_due 
FROM Client_View1
WHERE cid = 1001;

-- e) Insert a row into Client_vw2 (‘cn02003’, ‘alld’, 5000).
INSERT INTO Client_vw2 (cid, city, bal_due)
VALUES (
    2003,
    'alld',
    5000.00
);

-- f) Modify view Client_vw2 such that bal_due of Client_ID CN01004 now become 1000.
UPDATE Client 
SET bal_due = 1000.00
WHERE cid = 1004;

-- g) Delete row from view client_vw2 where Client_ID=’CN02003’.
DELETE FROM Client_vw3
WHERE cid = 2003;

-- h) Delete view client_vw3 from memory.
DROP VIEW Client_vw3;

-- i) Consider another table Client2 (ClientID, Phone). Create a view client_vw4 which has clientID, Client_name, bal_due and phone. Use both The tables Client and Client2.
CREATE VIEW Client_View4 AS
SELECT c.cid, c.cname, c.bal_due
FROM client c
JOIN client c2 
ON c.cid = c2.cid;