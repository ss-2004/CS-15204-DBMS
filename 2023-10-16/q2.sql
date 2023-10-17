-- 2b) Data for CLIENT_MASTER Table
INSERT INTO CLIENT_MASTER
VALUES ('C00001', 'Ivan Bayross', 'Address1', 'Address2', 'Mumbai', 400001, 'Maharashtra', 15000.00),
       ('C00002', 'Mamta Muzumdar', 'Address1', 'Address2', 'Madras', 780001, 'Tamil Nadu', 0.00),
       ('C00003', 'Chhaya Bankar', 'Address1', 'Address2', 'Mumbai', 400057, 'Maharashtra', 5000.00),
       ('C00004', 'Ashwini Joshi', 'Address1', 'Address2', 'Bangalore', 560001, 'Karnataka', 0.00),
       ('C00005', 'Hansei Colaco', 'Address1', 'Address2', 'Mumbai', 400060, 'Maharashtra', 2000.00),
       ('C00006', 'Deepak Sharma', 'Address1', 'Address2', 'Mangalore', 560050, 'Karnataka', 0.00);

-- 2c) Data for PRODUCT_MASTER Table
INSERT INTO PRODUCT_MASTER
VALUES ('P00001', 'T-Shirts', 5, 'Piece', 200, 50, 350.00, 250.00),
       ('P00345', 'Shirts', 6, 'Piece', 150, 50, 500.00, 350.00),
       ('P06734', 'Cotton Jeans', 5, 'Piece', 100, 20, 600.00, 450.00),
       ('P07865', 'Jeans', 5, 'Piece', 100, 20, 750.00, 500.00),
       ('P07868', 'Trousers', 2, 'Piece', 150, 50, 850.00, 550.00),
       ('P07885', 'Pull Overs', 2.5, 'Piece', 80, 30, 700.00, 450.00),
       ('P07965', 'Denim Shirts', 4, 'Piece', 100, 40, 350.00, 250.00),
       ('P07975', 'Lycra Tops', 5, 'Piece', 70, 30, 300.00, 175.00),
       ('P08865', 'Skirts', 5, 'Piece', 75, 30, 450.00, 300.00)

-- 2d) Data for SALESMAN_MASTER Table
INSERT INTO SALESMAN_MASTER
VALUES ('S00001', 'Aman', 'A/14', 'Worli', 'Mumbai', 400002, 'Maharashtra', 3000.00, 100, 50, 'Good'),
       ('S00002', 'Omkar', '65', 'Nariman', 'Mumbai', 780001, 'Maharashtra', 3000.00, 200, 100, 'Good'),
       ('S00003', 'Raj', 'P-7', 'Bandra', 'Mumbai', 400032, 'Maharashtra', 3000.00, 200, 100, 'Good'),
       ('S00004', 'Ashish', 'A/5', 'Juhu', '400044', 400044, 'Maharashtra', 3000.00, 200, 150, 'Good')

-- 2e) Data for SALES_ORDER Table
INSERT INTO sales_order
VALUES ('O19001', 'C00001', 'S00001', '2004-06-12', 'F', '2004-07-20', 'N', 'InProcess'),
       ('O19002', 'C00002', 'S00002', '2004-06-25', 'P', '2004-06-28', 'N', 'Cancelled'),
       ('O46865', 'C00003', 'S00003', '2004-02-18', 'F', '2004-02-20', 'Y', 'Fulfilled'),
       ('O19003', 'C00001', 'S00001', '2004-04-03', 'F', '2004-04-07', 'Y', 'Fulfilled'),
       ('O46866', 'C00004', 'S00002', '2004-05-20', 'P', '2004-05-22', 'N', 'Cancelled'),
       ('O19008', 'C00005', 'S00004', '2004-05-24', 'F', '2004-07-26', 'N', 'InProcess');

-- 2f) Data for SALES_ORDER_DETAILS Table
INSERT INTO sales_order_details
VALUES ('O19001', 'P00001', 4, 4, 525),
       ('O19001', 'P07965', 2, 1, 8400),
       ('O19001', 'P07885', 2, 1, 5250),
       ('O19002', 'P00001', 10, 0, 525),
       ('O46865', 'P07868', 3, 3, 3150),
       ('O46865', 'P07885', 3, 1, 5250),
       ('O46865', 'P00001', 10, 10, 525),
       ('O46865', 'P00345', 4, 4, 1050),
       ('O19003', 'P00345', 2, 2, 1050),
       ('O19003', 'P06734', 1, 1, 12000),
       ('O46866', 'P07965', 1, 0, 8400),
       ('O46866', 'P07975', 1, 0, 1050),
       ('O19008', 'P00001', 10, 5, 525),
       ('O19008', 'P07975', 5, 3, 1050);

