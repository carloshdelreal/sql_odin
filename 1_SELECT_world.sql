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