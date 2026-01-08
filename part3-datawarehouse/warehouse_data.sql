USE fleximart_dw;

-- CUSTOMER DIMENSION
INSERT INTO dim_customer VALUES
(1, 'Amit Sharma', 'Delhi', 'India'),
(2, 'Neha Verma', 'Mumbai', 'India'),
(3, 'Rahul Singh', 'Lucknow', 'India');

-- PRODUCT DIMENSION
INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mobile Phone', 'Electronics'),
(103, 'Shoes', 'Fashion');

-- DATE DIMENSION
INSERT INTO dim_date VALUES
(1, '2024-01-01', 2024, 1),
(2, '2024-01-02', 2024, 1),
(3, '2024-02-01', 2024, 2);

-- FACT TABLE
INSERT INTO fact_sales VALUES
(1, 1, 101, 1, 50000),
(2, 2, 102, 2, 30000),
(3, 3, 103, 3, 4000);

INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true);
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price)
VALUES
('P001','Laptop','Electronics','Computers',50000),
('P002','Mobile Phone','Electronics','Phones',30000),
('P003','T-Shirt','Fashion','Clothing',999);

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment)
VALUES
('C001','John Doe','Mumbai','MH','Retail'),
('C002','Anita Sharma','Delhi','DL','Corporate');


INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,2,50000,0,100000),
(20240106,2,2,1,30000,2000,28000);

SELECT * FROM fact_sales;

