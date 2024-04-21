SELECT s.name, ROUND(AVG(g.grade)) average_grade
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id 
GROUP BY g.student_id 
ORDER BY average_grade DESC
LIMIT 5