-- Basic configurations for container test databases

-- Create and add tables to testing inventory database
CREATE DATABASE InventoryDB;
USE InventoryDB;

CREATE TABLE Inventory (
    id INT PRIMARY KEY,
    name NVARCHAR(50),
    quantity INT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name NVARCHAR(100),
    contact_name NVARCHAR(50),
    contact_email NVARCHAR(100)
);

-- Create and add tables to testing customer database
CREATE DATABASE CustomerDB;
USE CustomerDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    email NVARCHAR(100) UNIQUE
);

-- Create and add tables to testing orders database
CREATE DATABASE OrdersDB;
USE OrdersDB;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE OrderDetails (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE ProductReviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    review_text NVARCHAR(MAX),
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);