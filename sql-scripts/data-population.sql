-- Template to populate container test databases with values

-- Add data to Inventory table in Inventory testing database
USE InventoryDB;
INSERT INTO Inventory VALUES (1, 'Banana', 150);
INSERT INTO Inventory VALUES (2, 'Orange', 154);
INSERT INTO Inventory VALUES (3, 'Apple', 10);
INSERT INTO Inventory VALUES (4, 'Bike', 17);
INSERT INTO Inventory VALUES (5, 'Chair', 12);
INSERT INTO Inventory VALUES (6, 'Table', 4);
INSERT INTO Inventory VALUES (7, 'Desk', 120);
INSERT INTO Inventory VALUES (8, 'Book', 142);
INSERT INTO Inventory VALUES (9, 'Glass', 100);
INSERT INTO Inventory VALUES (10, 'Jacket', 120);
INSERT INTO Inventory VALUES (11, 'Bread', 8);
INSERT INTO Inventory VALUES (12, 'Butter', 12);

-- Add data to Suppliers table in Inventory testing database
INSERT INTO Suppliers VALUES (1, 'Supplier A', 'John Doe', 'john@example.com');
INSERT INTO Suppliers VALUES (2, 'Supplier B', 'Jane Smith', 'jane@example.com');
INSERT INTO Suppliers VALUES (3, 'Supplier C', 'Bob Johnson', 'bob@example.com');

-- Add data to Customers table in Customer testing database
USE CustomerDB;
INSERT INTO Customers VALUES (1, 'Alice', 'Smith', 'alice@example.com');
INSERT INTO Customers VALUES (2, 'Bob', 'Johnson', 'bob@example.com');
INSERT INTO Customers VALUES (3, 'Charlie', 'Brown', 'charlie@example.com');

-- Add data to Orders table in Orders testing database
USE OrdersDB;
INSERT INTO Orders VALUES (1, 1, '2023-10-01');
INSERT INTO OrderDetails VALUES (1, 1, 1, 5, 10.99);
INSERT INTO OrderDetails VALUES (2, 1, 2, 2, 5.49);
INSERT INTO Orders VALUES (2, 2, '2023-10-02');
INSERT INTO OrderDetails VALUES (3, 2, 3, 3, 7.99);

-- Add data to Products table in Orders testing database
INSERT INTO Products VALUES (1, 'Product X', 19.99);
INSERT INTO Products VALUES (2, 'Product Y', 29.99);
INSERT INTO Products VALUES (3, 'Product Z', 39.99);

-- Add data to ProductReviews table in Orders testing database
INSERT INTO ProductReviews VALUES (1, 1, 1, 'Great product!', 5);
INSERT INTO ProductReviews VALUES (2, 1, 2, 'Good value for money', 4);
INSERT INTO ProductReviews VALUES (3, 2, 1, 'Could be better', 3);