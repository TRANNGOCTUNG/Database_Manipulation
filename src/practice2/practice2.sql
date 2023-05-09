USE managerstudents;
SELECT * FROM Student;

SELECT * FROM Student
WHERE student_status = true;

SELECT * FROM subjects
WHERE sub_credit < 10;

SELECT student.student_id,student.student_name,class.class_name
FROM class
INNER JOIN student ON class.class_id = student.class_id
WHERE class.class_name = 'A1';

SELECT Student.student_id,Student.student_name,subjects.sub_name,Marks.mark_mark
FROM student
INNER JOIN marks ON student.student_id = marks.student_id INNER JOIN subjects ON marks.sub_id = subjects.sub_id
WHERE subjects.sub_name = 'CF';