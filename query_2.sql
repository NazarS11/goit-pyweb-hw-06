SELECT sub.name subject, s.name student, ROUND(AVG(g.grade)) average_grade
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id 
WHERE g.subject_id = 1
GROUP BY g.student_id 
ORDER BY average_grade DESC
LIMIT 1