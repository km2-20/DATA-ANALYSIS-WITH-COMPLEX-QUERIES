-- 1. Student marks with course
SELECT s.name, c.course_name, r.marks
FROM results r
JOIN students s ON s.student_id = r.student_id
JOIN courses c ON c.course_id = r.course_id;

-- 2. Average marks
WITH avg_marks AS (
    SELECT student_id, AVG(marks) AS avg_score
    FROM results
    GROUP BY student_id
)
SELECT s.name, a.avg_score
FROM avg_marks a
JOIN students s ON s.student_id = a.student_id;

-- 3. Total marks ranking
SELECT s.name, SUM(r.marks) AS total_marks
FROM results r
JOIN students s ON s.student_id = r.student_id
GROUP BY s.name
ORDER BY total_marks DESC;
