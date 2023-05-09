CREATE DATABASE ManagerStudents;
USE ManagerStudents;
CREATE TABLE Class (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    class_startDate DATE,
    class_status INT
);
CREATE TABLE Student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_address VARCHAR(255) NOT NULL,
    student_phone VARCHAR(255) NOT NULL,
    student_status INT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id)
);
CREATE TABLE Subjects (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_Name VARCHAR(255) NOT NULL,
    sub_credit INT NOT NULL,
    sub_status INT NOT NULL
);
CREATE TABLE Marks (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark_mark INT NOT NULL ,
    mark_examTimes INT NOT NULL
);

INSERT INTO Class(class_name, class_startDate, class_status)
VALUES ('A1','2008-12-20',1),
       ('A2','2008-12-20',1),
       ('32',class_startDate,0);

INSERT INTO Student (student_name, student_address, student_phone, student_status, class_id)
VALUES ('Hùng','Hà Nội','0912113113',1,4),
       ('Hoa','Hải Phòng',student_phone,1,5),
       ('Manh','Hồ Chí Minh','0123123123',0,6);

INSERT INTO Subjects(sub_Name, sub_credit, sub_status)
VALUES ('CF',5,1),
       ('C',6,1),
       ('HDJ',5,1),
       ('RDBMS',10,1);

INSERT INTO Student(student_name, student_address, student_phone, student_status, class_id)
VALUES ('Trương Đình Hoàng','Nam Định','01234567',1,4);

SELECT * FROM Class;
truncate TABLE marks;
ALTER TABLE Marks add constraint foreign key (student_id) REFERENCES Student(student_id);

INSERT INTO Marks( sub_id, student_id, mark_mark, mark_examTimes)
VALUES (1,21,8,1),
       (1,22,10,2),
       (2,23,12,1);

SELECT * FROM Student;