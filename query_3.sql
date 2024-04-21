SELECT sub.name subject, gr.name 'group', ROUND(AVG(g.grade)) average_grade
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN groups gr ON s.group_id = gr.id
WHERE g.subject_id = 1
GROUP BY s.group_id 
ORDER BY gr.name
