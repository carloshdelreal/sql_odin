-- 1. Introduction

SELECT name, continent, population FROM world

-- 2. Large Countries

SELECT name FROM world
WHERE population > 200000000

-- 3. Per capita GDP

SELECT name, gdp/population 
FROM world
WHERE population > 200000000

-- 4. South America In millions

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- 5. 'Germany', 'France', 'Italy' population

SELECT name, population
FROM world
WHERE name in ('Germany', 'France', 'Italy')

-- 6. United

SELECT name
FROM world
WHERE name LIKE '%United%'

-- 7. Two ways to be big

SELECT name, population, area
FROM world
WHERE population > 250000000 OR area > 3000000

-- 8. One or the other (but not both)

SELECT name, population, area
FROM world
WHERE population > 250000000 XOR area > 3000000
