SELECT gr.name 'group', sub.name subject, s.name student, g.date_received, g.grade
FROM grades g 
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN groups gr ON s.group_id = gr.id
WHERE sub.id = 1 AND gr.id = 1 AND g.date_received = (
    SELECT MAX(grades.date_received)
    FROM grades
    JOIN students ON grades.student_id = students.id
    WHERE students.group_id = s.group_id
    AND grades.subject_id = sub.id
)