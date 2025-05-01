-- question 1 solution  that eliminates the repeating groups and makes the table meet the rules of 1NF
CREATE DATABASE Shop;
USE shop;

CREATE TABLE product_order1NF 
(
    orderid INT,
    customername VARCHAR(255),
    product VARCHAR(255) 
);

-- Inserting transformed data into 1NF
INSERT INTO product_order1NF (orderid, customername, product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');






-- question 2 solution that eliminates the  removes partial dependencies and makes the table meet the rules of 2NF
CREATE TABLE products 
(
productid INT PRIMARY KEY ,
productname VARCHAR (255),
quantity VARCHAR (255)
)
;

CREATE TABLE customers 
(
customerid INT PRIMARY KEY ,
firstname VARCHAR (255),
lastname VARCHAR (255),
productid INT,
FOREIGN KEY (productid)  REFERENCES products(productID)
)
;


CREATE TABLE orders 
(
orderid int PRIMARY KEY ,
customerid INT ,
productid int,
FOREIGN KEY (customerid) REFERENCES customers(customerid),
FOREIGN KEY (productid) REFERENCES products(productid)
)
;