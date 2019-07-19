-- 1. Teachers without departament

SELECT name FROM teacher
WHERE dept IS NULL

-- 2. Inner Join

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3. Join Left

SELECT  teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- 4. Join Right

SELECT  teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- 5. Coalesce

SELECT teacher.name, COALESCE(teacher.mobile, '07986 444 2266') as mobile FROM teacher

-- 6. Teacher and Dept Name

SELECT teacher.name, COALESCE(dept.name,'None') 
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

-- 7. Count Mobile and Teachers

SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher

-- 8. Staff count

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
GROUP BY dept.name

-- 9. Teacher Title

SELECT teacher.name,
CASE WHEN dept = 1 THEN 'Sci'
     WHEN dept = 2 THEN 'Sci'
     ELSE 'Art'
END
FROM teacher

-- 10. Case teacher

SELECT teacher.name,
CASE WHEN dept = 1 THEN 'Sci'
     WHEN dept = 2 THEN 'Sci'
     WHEN dept = 3 THEN 'Art'
     ELSE 'None'
END
FROM teacher
