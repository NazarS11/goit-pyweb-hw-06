SELECT t.name teacher, s.name subject, ROUND(AVG(g.grade)) average_grade
FROM grades g 
LEFT JOIN subjects s ON g.subject_id = s.id
LEFT JOIN teachers t ON s.teacher_id = t.id
WHERE t.id = 3
GROUP BY s.id 
ORDER BY s.name