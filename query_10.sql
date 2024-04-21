SELECT s.name student, t.name teacher, sub.name subject
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN groups gr ON s.group_id = gr.id
LEFT JOIN teachers t ON sub.teacher_id = t.id
WHERE s.id = 4 and t.id = 3
GROUP BY g.subject_id 
ORDER BY sub.name
