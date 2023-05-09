USE managerstudents;
SELECT * FROM student
WHERE student_name LIKE 'H%';

SELECT * FROM class
WHERE MONTH(class_startDate) = 12;

SELECT * FROM subjects
WHERE sub_credit BETWEEN 3 AND 5;

SELECT student_id FROM student WHERE student_name = 'Hùng';
UPDATE marks SET student_id = 21 WHERE student_id = 26;

SELECT student.student_name,subjects.sub_Name,marks.mark_mark
    FROM student
INNER JOIN marks ON student.student_id = marks.student_id
INNER JOIN subjects ON marks.sub_id = subjects.sub_id
ORDER BY marks.mark_mark DESC , student.student_name ASC;