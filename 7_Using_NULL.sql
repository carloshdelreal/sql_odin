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