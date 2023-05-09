CREATE DATABASE ManagerCustomers;
USE ManagerCustomers;
CREATE TABLE Customers (
                           customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           customer_name VARCHAR(255) NOT NULL,
                           customer_country VARCHAR(255) NOT NULL
);
CREATE TABLE Orders (
                        order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        customer_id INT NOT NULL,
                        order_date DATE
);
ALTER TABLE Orders ADD foreign key (customer_id) references Customers(customer_id);
ALTER TABLE Orders MODIFY COLUMN order_date DATE;

INSERT INTO Customers (customer_name, customer_country)
VALUES
    ('Trần Xuân Mạnh','Nam Định'),
    ('Trần Minh Ngọc','Nam Định'),
    ('Trần Ngọc Ang','Nam Định');
INSERT INTO Orders (customer_id, order_date)
VALUES
    (1,'1990-02-15'),
    (2,'2000-12-3'),
    (3,'2005-10-5'),
    (4,'2010-9-19');

UPDATE customers SET customer_name = 'Trần Ngọc Anh',customer_country = 'Nam Định'
                 WHERE customer_id = 3;

INSERT INTO customers (customer_name, customer_country)
VALUES ('Trần Ngọc Tiến','Nam Định'),
('Trần Huy Hoàng','Hà Nội');
INSERT INTO customers (customer_name, customer_country)
VALUES ('Trần Ngọc Hải','Nam Định'),
       ('Trần Huy Hà','Hà Nội');

DELETE FROM Customers WHERE customer_id = 5;

SELECT * FROM orders;

SELECT Orders.order_id,Customers.customer_name,Customers.customer_country,Orders.order_date
    FROM Customers
INNER JOIN Orders ON Customers.customer_id =Orders.customer_id;

SELECT Customers.customer_id,Customers.customer_name,Customers.customer_country,Orders.order_date
 FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.customer_id,Customers.customer_name,Customers.customer_country,Orders.order_date
FROM Customers
Right Join Orders ON Customers.customer_id = Orders.customer_id;

SELECT Customers.customer_id,Customers.customer_name,Customers.customer_country,Orders.order_date
FROM Customers
CROSS JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT * FROM Customers
ORDER BY customer_name;

SELECT COUNT(customer_id),customer_name
FROM Customers
GROUP BY customer_name;