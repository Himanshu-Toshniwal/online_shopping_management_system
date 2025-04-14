CREATE DATABASE BIG_BUY;

USE BIG_BUY;

CREATE TABLE Users(
UserID INT PRIMARY KEY,
Username VARCHAR(100) NOT NULL,
Password VARCHAR(100),
Email VARCHAR(100),
MembershipStatus VARCHAR(50)
);

CREATE TABLE ProductModels(
ProductModelID INT PRIMARY KEY,
ProductModel VARCHAR(100),
ModelYear INT
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
UserID INT,
OrderDate TIMESTAMP,
TotalAmount DECIMAL(10,2),
Status VARCHAR(50),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(100)
);

CREATE TABLE SUPPLIERS (
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(100),
SupplierAddress VARCHAR(200)
);

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
ProductDescription VARCHAR(500),
Price DECIMAL(10,2),
StockQuantity INT,
CategoryID INT,
SupplierID INT,
ProductModelID INT,
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
FOREIGN KEY (ProductModelID) REFERENCES ProductModels(ProductModelID)
);

CREATE TABLE OrderDetails(
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Reviews(
ReviewID INT PRIMARY KEY,
ProductID INT,
UserID INT,
Rating INT,
Comment VARCHAR(255),
ReviewDate TIMESTAMP,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Payments(
PaymentID INT PRIMARY KEY,
OrderID INT,
PaymentDate TIMESTAMP,
Amount DECIMAL(10,2),
PaymentMethod VARCHar(100),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Shippings(
ShippingID INT PRIMARY KEY,
OrderID INT,
ShippingAddress VARCHAR(200),
ShippingDate TIMESTAMP,
DeliveryDate TIMESTAMP,
ShippingStatus VARCHAR(100),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
); 


INSERT INTO Users(UserID, Username, Password, Email, MembershipStatus) VALUES
(1, 'Himanshu Toshniwal', 'password123', 'himanshu@7075', 'Active'),
(2, 'Varsha Kumawat', 'password456', 'palak@7075', 'Active'),
(3, 'Deepa Chauhan', 'password789', 'deepa@7075', 'Inactive'),
(4, 'Himanshu Kumawat', 'password345', 'himanshu@6918', 'Active'),
(5, 'Mahipal Singh', 'password908', 'mahipal@9494', 'Inactive'),
(6, 'Palak Maheshwari', 'password222', 'palak@4518', 'Active'),
(7, 'Habbii Shah', 'password178', 'habbii@7075', 'Inactive'),
(8, 'Tanisha Sharma', 'password6363', 'tanisha@7075', 'Active'),
(9, 'Kajal Agarwal', 'password8484', 'kajal@1450', 'Inactive'),
(10, 'Snoozy Agarwal', 'password321', 'snoozy@7570', 'Active');

INSERT INTO ProductModels(ProductModelID, ProductModel, ModelYear) VALUES
(1, 'Model H', 2020),
(2, 'Model V', 2021),
(3, 'Model D', 2022),
(4, 'Model HK', 2023),
(5, 'Model M', 2024),
(6, 'Model P', 2015),
(7, 'Model A', 2022),
(8, 'Model T', 2024),
(9, 'Model K', 2022),
(10, 'Model S', 2021);

INSERT INTO Orders(OrderID, UserID, OrderDate, TotalAmount, Status) VALUES
(1, 1, '2025-02-23', 699.99, 'Delivered'),
(2, 1, '2025-02-24', 999.99, 'Processing'),
(3, 1, '2025-02-25', 499.99, 'Shipped'),
(4, 2, '2025-02-27', 199.99, 'Delivered'),
(5, 2, '2025-02-28', 69.99, 'Processing'),
(6, 3, '2025-03-01', 299.99, 'Processing'),
(7, 3, '2025-03-02', 799.99, 'Shipped'),
(8, 4, '2025-03-03', 499.99, 'Delivered'),
(9, 5, '2025-03-04', 389.99, 'Delivered'),
(10, 6, '2025-03-05', 889.99, 'Shipped');


INSERT INTO Categories(CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Sports & Outdoors'),
(6, 'Toys & Games'),
(7, 'Automative'),
(8, 'Health & Beauty'),
(9, 'Furniture'),
(10, 'Jewelry');


INSERT INTO SUPPLIERS(SupplierID, SupplierName, SupplierAddress) VALUES
(1, 'Quality Goods', '18 NEW COLONY, Kuchaman City, India'),
(2, 'Tech Warehouse', '321 Oak pine, Mumbai, India'),
(3, 'Tech Warehouse', '234 Sector 19 Plaza, Barmer, India'),
(4, 'Gadget Store', 'Budsu Road, Ajmer, India'),
(5, 'Fashion Factory', '987 Birch Set, Udaipur, India'),
(6, 'Sports Hub', '432 Madan Road, Jodhpur, India'),
(7, 'Book World', 'aldico Green Plaza, Jalandhar, India'),
(8, 'Adventure Gear', '456 Spruce ST, Delhi, India'),
(9, 'Kitchen Suppliers', '48 gandhi chowk, Jaipur, India'),
(10, 'Jewelers Co', '654 Chestnut St, Makrana, India');


INSERT INTO Products(ProductID, ProductName, ProductDescription, Price, StockQuantity, CategoryID, SupplierID, ProductModelID) VALUES
(1, 'Smartphone', 'Latest Smartphone with advanced features', 699.99, 100, 1,1,1),
(2, 'Laptop', 'High-performance laptop', 999.99, 50, 1,1,2),
(3, 'T-Shirt', 'Comfortable cotton t-shirt', 499.99, 200, 2,2,3),
(4, 'Blender', 'High speen blender for smoothies', 199.99, 80, 3,4,4),
(5, 'Novel', 'Best Selling fiction novel', 69.99, 150, 4,5,5),
(6, 'Running Shoes', 'Lightweight running shoes', 299.99, 120, 5,6,6),
(7, 'Toy-Car', 'Battery-operated toy car', 799.99, 100, 6,7,7),
(8, 'Backpack', 'Durable travel pack', 499.99, 19, 7,8,8),
(9, 'Coffee Maker', 'Programmable coffee maker', 389.99, 70, 8,9,9),
(10, 'Necklace', 'Gold-plated necklace', 889.99, 20, 9,10,10);

INSERT INTO ORDERDETAILS (OrderDetailID, OrderId, ProductID,Quantity) VALUES
(1,1,1,1),
(2,2,2,1),
(3,3,3,1),
(4,4,2,1),
(5,5,1,1),
(6,6,3,1),
(7,7,4,1),
(8,8,5,2),
(9,9,6,1),
(10,10,7,3);

INSERT INTO Reviews(ReviewID, ProductID, UserID, Rating, Comment, ReviewDate) VALUES
(1,1,1,5,'Excellent product!', '2025-03-01'),
(2,2,1,5,'Very good, satisfied with the purchase.', '2025-03-02'),
(3,3,1,3,'Average quality.','2025-03-03'),
(4,2,2,4,'Good product, but could be better','2025-03-04'),
(5,1,2,5,'Average.','2025-03-05'),
(6,3,3,5, 'Fantastic!', '2025-03-06'),
(7,4,4,2, 'Not as expected', '2025-03-07'),
(8,5,5,3, 'It"s okay', '2025-03-08'),
(9,6,6,4, 'Satisfied with the purchase.','2025-03-09'),
(10,7,7,5,'Amazing product!', '2025-01-10');

INSERT INTO Payments(PaymentID, OrderID, PaymentDate, Amount, PaymentMethod) Values
(1, 1, '2025-02-23', 699.99, 'Credit Card'),
(2, 2, '2025-02-24', 999.99, 'Credit Card'),
(3, 3, '2025-02-25', 499.99, 'PayPal'),
(4, 4, '2025-02-27', 199.99, 'Credit Card'),
(5, 5, '2025-02-28', 69.99, 'Credit Card'),
(6, 6, '2025-03-01', 299.99, 'Credit Card'),
(7, 7, '2025-03-02', 799.99, 'PayPal'),
(8, 8, '2025-03-03', 499.99, 'PayPal'),
(9, 9, '2025-03-04', 389.99, 'Credit Card'),
(10, 10, '2025-03-05', 889.99, 'Credit Card');


INSERT INTO Shippings(ShippingID, OrderID, ShippingDate, ShippingAddress, DeliveryDate, ShippingStatus) VALUES
(1, 1, '2025-02-25', '654 Chestnut St, Makrana, India' , '2025-02-28', 'Delivered'),
(2, 2, '2025-02-26', '48 gandhi chowk, Jaipur, India' , '2025-03-01', 'Processing'),
(3, 3, '2025-02-27', '456 Spruce ST, Delhi, India', '2025-03-02', 'Shipped'),
(4, 4, '2025-02-28', 'aldico Green Plaza, Jalandhar, India' , '2025-03-03', 'Delivered'),
(5, 5, '2025-03-01', '432 Madan Road, Jodhpur, India','2025-03-04', 'Processing'),
(6, 6, '2025-03-02', '987 Birch Set, Udaipur, India' ,'2025-03-05', 'Processing'),
(7, 7, '2025-03-03', 'Budsu Road, Ajmer, India','2025-03-06', 'Shipped'),
(8, 8, '2025-03-04', '234 Sector 19 Plaza, Barmer, India','2025-03-07', 'Delivered'),
(9, 9, '2025-03-05', '321 Oak pine, Mumbai, India','2025-03-08', 'Delivered'),
(10, 10, '2025-03-06', '18 NEW COLONY, Kuchaman City, India','2025-03-09', 'Shipped');

-- Select Queries

SELECT * FROM Users;

SELECT * FROM Products;

SELECT OrderID, UserID, OrderDate FROM Orders;

SELECT DISTINCT ProductModel FROM ProductModels;

-- Conditional Queries

SELECT * FROM Users WHERE MembershipStatus = 'Active';

SELECT * FROM orders WHERE TotalAmount > 100;

SELECT * FROM Products WHERE StockQuantity > 0;

SELECT * FROM Reviews WHERE Rating = 5;

-- WildCard Queries

SELECT * FROM Users WHERE Username LIKE 'H%'; 

 SELECT * FROM Products WHERE ProductName LIKE '%car%';
 
 SELECT * FROM Users WHERE Email LIKE 'snoozy@7570';
 
 SELECT * FROM Shippings WHERE ShippingAddress LIKE '%Kuchaman City%';
 
 -- Sorting Queries
 
 SELECT * FROM orders WHERE Status = 'Delivered' ORDER BY OrderDate DESC;
 
 SELECT * FROM Reviews WHERE Rating < 3 ORDER BY Rating ASC;
 
--   Single Row Functions

SELECT UPPER(Username) FROM Users;
 
 SELECT ProductName, LENGTH(ProductName) as LengthOfProductName
 FROM Products ORDER BY LengthOfProductName ASC;
 
 SELECT CURRENT_DATE;
 
 SELECT ProductDescription, SUBSTR(ProductDescription, 1, 8)
 as HalfDescription FROM Products;
 
 
 -- Joins Multiple Tables
 

SELECT Users.Username, Orders.OrderDate, Orders.TotalAmount   # INNER JOIN  Users and Orders on UserID
FROM Users JOIN Orders
ON Users.UserID = Orders.UserID;


# LEFT JOIN between  Orders and Payments on OrderID
SELECT Orders.OrderDate, Orders.TotalAmount, Payments.PaymentDATE
FROM Orders LEFT JOIN Payments
ON Orders.OrderID = Payments.OrderID;   

# Right JOIN between Products and Categories on CategoryID
SELECT Products.ProductName, Categories.CategoryName
FROM Products RIGHT JOIN Categories
ON Products.CategoryID = Categories.CategoryID;  

# JOIN BETWEEN PRODUCTS AND SUPPLIERS ON SUPPLIERID:

SELECT Products.ProductName, SUPPLIERS.SupplierName
FROM Products JOIN SUPPLIERS
ON Products.SupplierID = SUPPLIERS.SupplierID;


# Group Functions

SELECT COUNT(*) as TotalUsers FROM Users;

SELECT AVG(Rating) as AverageRating FROM Reviews;

SELECT SUM(TotalAmount) as SumOfAmount FROM Orders;

SELECT MAX(Price) as MaximumProductPrice FROM products;

# Subqueries

SELECT * FROM Orders WHERE OrderID IN
(SELECT OrderID FROM OrderDetails WHERE ProductID = 1);


SELECT * FROM Users WHERE UserID IN
(SELECT UserID FROM orders WHERE TotalAmount > 100);

# Update Queries

UPDATE Orders SET STATUS = 'Delivered' WHERE OrderID = 2;

UPDATE Reviews SET Rating = 4 WHERE ReviewID = 2;

# DeELETE QUERY
DELETE FROM Reviews WHERE Rating = 1;

# COMMIT AND ROLLEBACK Statements;

START TRANSACTION;

START TRANSACTION;

INSERT INTO Users(UserID, Username, Password, Email, MembershipStatus)
VALUES(21, 'new_user', 'password321', 'new_user@456', 'Active');

COMMIT;







 
 






















































































































































































