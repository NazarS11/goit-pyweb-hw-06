SELECT s.name student, sub.name subject
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN groups gr ON s.group_id = gr.id
WHERE s.id = 4
GROUP BY g.subject_id 
ORDER BY sub.name