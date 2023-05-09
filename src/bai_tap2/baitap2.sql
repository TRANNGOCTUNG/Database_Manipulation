CREATE DATABASE SaleManagers;
USE SaleManagers;
CREATE TABLE Customers (
 CustomerID INTEGER PRIMARY KEY,
 CustomerName VARCHAR(255) NOT NULL,
 CustomerAge TINYINT
);
ALTER TABLE Customers MODIFY COLUMN CustomerID INT NOT NULL;

CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate  DATE,
    OrderTotal INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

CREATE TABLE Products (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ProductPrice FLOAT
);

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDetailsQTY INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
INSERT INTO customers (CustomerID, CustomerName, CustomerAge)
VALUES (1,'Trần Xuân Mạnh',23),
       (2,'Trần Nhật Hoàng',20),
       (3,'Trương Nhật Hoàng',30),
       (4,'Nguyễn Viết Hải',22),
       (5,'Vũ Đình Việt',19);


INSERT INTO Orders (orderid, customerid, orderdate)
VALUES (6,1,'2000-12-18'),
       (7,2,'2000-12-15'),
       (8,3,'2014-1-1'),
       (9,4,'2015-7-15'),
       (10,5,'2020-10-29');

INSERT INTO  Products (productid, productname, productprice)
VALUES (11,'Máy Giặt',3.5),
(12,'Tủ Lạnh',3.5),
(13,'Điều Hòa',7.5),
(14,'Quạt',1.5),
(15,'Bếp Điện',2.5);

INSERT INTO OrderDetails (OrderID, ProductID, OrderDetailsQTY)
VALUES (6,11,3),
       (7,12,7),
       (8,13,2),
       (9,14,1),
       (10,15,8);

SELECT OrderID,OrderDate,OrderTotal AS OrderPrice
FROM Orders;

SELECT CustomerName,ProductName
FROM Customers
INNER JOIN Orders o ON Customers.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;

SELECT customers.CustomerName
FROM Customers
LEFT JOIN Orders o ON Customers.CustomerID = o.CustomerID
WHERE o.OrderTotal IS NULL;

SELECT CustomerName,ProductName
FROM Customers
INNER JOIN Orders O on Customers.CustomerID = O.CustomerID
INNER JOIN OrderDetails OD on O.OrderID = OD.OrderID
INNER JOIN Products P on OD.ProductID = P.ProductID;

SELECT CustomerName,OrderTotal
FROM Customers
INNER JOIN Orders O ON Customers.CustomerID = O.CustomerID
WHERE O.OrderTotal IS NULL;

SELECT Orders.OrderID,Orders.OrderDate,SUM( OrderDetailsQTY * ProductPrice) AS invoice_total_price
FROM Orders
INNER JOIN orderdetails o on Orders.OrderID = o.OrderID
INNER JOIN Products P on o.ProductID = P.ProductID
GROUP BY Orders.OrderID;