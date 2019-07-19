-- 1. Winners from 1950

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- 2. 1962 Literature

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

-- 3. Albert Einstein

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4. Peace Prices

SELECT winner
FROM nobel
WHERE yr >=2000 
AND subject = 'Peace'

-- 5. Literature in the 80's

SELECT yr, subject, winner
FROM nobel
WHERE yr >= 1980
AND yr <= 1989
AND subject = 'Literature'

-- 6. Only Presidents

SELECT * FROM nobel
WHERE winner IN ( 'Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7. John

SELECT winner FROM nobel
WHERE winner LIKE 'John%'

-- 8. Chemistry and Physics for different years

SELECT yr, subject, winner FROM nobel
WHERE yr = 1980 AND subject = 'Physics'
OR yr = 1984 and subject = 'Chemistry'

-- 9. Exclude Chemists and Medics

SELECT yr, subject, winner FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry', 'Medicine')

-- 10. Early Medicine, late literature

SELECT yr, subject, winner FROM nobel
WHERE yr < 1910 and subject = 'Medicine'
OR (yr >= 2004 and subject = 'Literature')

-- 11. 

