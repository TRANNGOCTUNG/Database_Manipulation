CREATE DATABASE ManagerStaffs;
USE ManagerStaffs;
CREATE TABLE Staffs (
    staff_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(255) NOT NULL,
    staff_age BIT,
    staff_address VARCHAR(255) NOT NULL,
    staff_wage FLOAT
);
ALTER TABLE Staffs MODIFY COLUMN staff_age TINYINT;
INSERT INTO Staffs (staff_name,staff_age,staff_address,staff_wage)
VALUES
    ('Thanh',32,'Hải Phòng',2000.00),
    ('Loan',25,'Hà Nội',1500.00),
    ('Nga',23,'HÀ Nam',2000.00),
    ('Mạnh',25,'Huế',6500.00),
    ('Huy',27,'Hà Tĩnh',8500.00),
    ('Cao',22,'Hồ Chí Minh',4500.00),
    ('Lâm',24,'Hà Nội',10000.00);

SELECT * FROM Staffs;

SELECT staff_name,SUM(staff_wage) AS total_wage
FROM Staffs
GROUP BY staff_name;

SELECT SUM(staff_wage)
FROM Staffs;

SELECT staff_name, GROUP_CONCAT(staff_wage) AS staff_wages
FROM Staffs
GROUP BY staff_name WITH ROLLUP;


SELECT staff_name, SUM(staff_wage) AS total_wage
FROM Staffs
GROUP BY staff_name WITH ROLLUP
HAVING staff_name IS NOT NULL;

SELECT COUNT(staff_id),staff_name
FROM Staffs
GROUP BY staff_name
HAVING COUNT(staff_id) < 3;

SELECT COUNT(staff_id) AS staffCount, staff_name AS staffName
FROM Staffs
GROUP BY staffName
HAVING staffCount < 3;