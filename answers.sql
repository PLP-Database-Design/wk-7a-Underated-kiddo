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


-- Created a table for customers to remove partial dependency of CustomerName on OrderID
CREATE TABLE customers 
(
    customerid INT PRIMARY KEY,
    customername VARCHAR(255)
);

-- Create a table for orders
CREATE TABLE orders 
(
    orderid INT PRIMARY KEY,
    customerid INT,
    productid INT,
    quantity INT,
    FOREIGN KEY (customerid) REFERENCES customers(customerid),
    FOREIGN KEY (productid) REFERENCES products(productid)
);

-- Create a table for products
CREATE TABLE products 
(
    productid INT PRIMARY KEY,
    productname VARCHAR(255)
);

-- Insert data into the customers table
INSERT INTO customers (customerid, customername) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Emily Clark');

-- Insert data into the products table
INSERT INTO products (productid, productname) VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Tablet'),
(4, 'Keyboard'),
(5, 'Phone');

-- Insert data into the orders table
INSERT INTO orders (orderid, customerid, productid, quantity) VALUES
(101, 1, 1, 2),
(101, 1, 2, 1),
(102, 2, 3, 3),
(102, 2, 4, 1),
(103, 3, 5, 1);