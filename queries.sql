SELECT * FROM Students
WHERE department IN ('CSE','ISE');

SELECT * FROM Courses
WHERE credits BETWEEN 3 AND 4;

SELECT * FROM Enrollments
WHERE instructor_id IS NULL;

SELECT department,
COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*)>=2;

SELECT student_name,course_name
FROM Students
INNER JOIN Enrollments
ON Students.student_id=Enrollments.student_id
INNER JOIN Courses
ON Courses.course_id=Enrollments.course_id;

SELECT student_name,course_name
FROM Students
LEFT JOIN Enrollments
ON Students.student_id=Enrollments.student_id
LEFT JOIN Courses
ON Courses.course_id=Enrollments.course_id;

SELECT student_name,course_name
FROM Courses
LEFT JOIN Enrollments
ON Courses.course_id=Enrollments.course_id
LEFT JOIN Students
ON Students.student_id=Enrollments.student_id;

SELECT student_name
FROM Students
WHERE student_id=
(
SELECT MIN(student_id)
FROM Students
);

SELECT student_name
FROM Students s
WHERE EXISTS
(
SELECT 1
FROM Enrollments e
WHERE e.student_id=s.student_id
);

SELECT *
FROM Courses c
WHERE EXISTS
(
SELECT *
FROM Enrollments e
WHERE e.course_id=c.course_id
);

SELECT student_name AS Name
FROM Students

UNION

SELECT instructor_name
FROM Instructors;

SELECT
student_name,
department,
ROW_NUMBER() OVER
(PARTITION BY department ORDER BY student_name)
AS RankNo
FROM Students;
