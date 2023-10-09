-- Basic configurations for container test databases

-- Use BEGIN and END blocks to group multiple SQL statements into a single transaction
-- The GO statement is used to separate batches in scripts, where a batch is a set of statements sent to the server for execution as a group
-- Batches are separated by a batch delimiter, as each batch is executed as a unit of work and SQL Server processes one batch at a time

-- Create and add tables for Inventory testing database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'InventoryDB')
BEGIN
    CREATE DATABASE InventoryDB;
END
GO

USE InventoryDB;
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Inventory')
BEGIN
    CREATE TABLE Inventory (
        id INT PRIMARY KEY,
        name NVARCHAR(50),
        quantity INT
    );
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Suppliers')
BEGIN
    CREATE TABLE Suppliers (
        supplier_id INT PRIMARY KEY,
        supplier_name NVARCHAR(100),
        contact_name NVARCHAR(50),
        contact_email NVARCHAR(100)
    );
END
GO

-- Create and add tables to Customer testing database
CREATE DATABASE CustomerDB;
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CustomerDB')
BEGIN
    CREATE DATABASE CustomerDB;
END
GO

USE CustomerDB;
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Customers')
BEGIN
    CREATE TABLE Customers (
        customer_id INT PRIMARY KEY,
        first_name NVARCHAR(50),
        last_name NVARCHAR(50),
        email NVARCHAR(100) UNIQUE
    );
END
GO

-- Create and add tables to Orders testing database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'OrdersDB')
BEGIN
    CREATE DATABASE OrdersDB;
END
GO

USE OrdersDB;
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Orders')
BEGIN
    CREATE TABLE Orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        order_date DATE
    );
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OrderDetails')
BEGIN
    CREATE TABLE OrderDetails (
        detail_id INT PRIMARY KEY,
        order_id INT,
        product_id INT,
        quantity INT,
        price DECIMAL(10, 2),
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    );
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
    CREATE TABLE Products (
        product_id INT PRIMARY KEY,
        product_name NVARCHAR(100),
        price DECIMAL(10, 2)
    );
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ProductReviews')
BEGIN
    CREATE TABLE ProductReviews (
        review_id INT PRIMARY KEY,
        product_id INT,
        order_id INT,
        review_text NVARCHAR(MAX),
        rating INT CHECK (rating >= 1 AND rating <= 5),
        FOREIGN KEY (product_id) REFERENCES Products(product_id),
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    );
END