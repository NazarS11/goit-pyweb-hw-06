SELECT g.name 'group', s.name student 
FROM groups g 
LEFT JOIN students s ON g.id = s.group_id
WHERE g.id = 3
ORDER BY s.name