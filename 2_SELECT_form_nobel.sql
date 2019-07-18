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