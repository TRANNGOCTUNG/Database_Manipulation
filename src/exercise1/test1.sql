CREATE DATABASE ManagerStudentss;
USE ManagerStudentss;
CREATE TABLE Classes (
    class_id INT PRIMARY KEY PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    class_date DATE
);
CREATE TABLE Students (
    student_id INT PRIMARY KEY PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_status INT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes (class_id)
);
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);
ALTER TABLE Subjects ADD COLUMN subject_credit INT NOT NULL AFTER subject_name;
INSERT INTO Classes (class_id, class_name, class_date)
VALUES (1,'C1022K1','2022-10-27'),
       (2,'C1122H1','2022-12-12'),
       (3,'C0223G1','2023-02-12');

