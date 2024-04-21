SELECT t.name teacher, s.name subject
FROM subjects s 
LEFT JOIN teachers t ON s.teacher_id = t.id
WHERE t.id = 3
ORDER BY s.name