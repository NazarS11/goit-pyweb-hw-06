SELECT s.name student, t.name teacher, ROUND(AVG(g.grade)) average_grade
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN groups gr ON s.group_id = gr.id
LEFT JOIN teachers t ON sub.teacher_id = t.id
WHERE s.id = 4 and t.id = 1
GROUP BY s.id