SELECT sub.name subject, g2.name 'group', s.name student, g.grade grade
FROM grades g 
LEFT JOIN subjects sub ON g.subject_id = sub.id
LEFT JOIN students s ON g.student_id = s.id
LEFT JOIN groups g2 ON s.group_id = g2.id
WHERE sub.id = 2 AND g2.id = 1
ORDER BY s.name