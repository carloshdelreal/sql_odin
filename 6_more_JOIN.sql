-- 1. movie 1962

SELECT id, title
FROM movie
WHERE yr=1962

-- 2. Citizen Kane

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3. Star Trek movies

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'

-- 4. Glenn Close

SELECT id FROM actor
WHERE name = 'Glenn Close'

-- 5. ID for Casablanca

SELECT id FROM movie
WHERE title = 'Casablanca'

-- 6. Cablanca casting

SELECT name FROM actor JOIN casting ON actorid=id
WHERE movieid=11768

-- 7. Alien cast list

SELECT name FROM actor JOIN casting ON actorid=id
WHERE movieid= (SELECT id FROM movie WHERE title = 'Alien')

-- 8. Harrison Ford

SELECT movie.title FROM movie JOIN casting ON movie.id=casting.movieid
WHERE casting.actorid = (SELECT actor.id FROM actor WHERE name = 'Harrison Ford')

-- 9. Harrison Ford not as Main Actor

SELECT movie.title FROM movie JOIN casting ON movie.id=casting.movieid
WHERE casting.actorid = (SELECT actor.id FROM actor WHERE name = 'Harrison Ford')
AND casting.ord <> 1

-- 10. Movies and Stars 1962

SELECT movie.title, actor.name
FROM movie JOIN casting ON movie.id=casting.movieid JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
AND movie.yr = 1962

-- 11. John Travolta

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

-- 12. Lead actor in Julie Andrews

SELECT movie.title, actor.name
FROM movie JOIN casting ON (movie.id=casting.movieid)
JOIN actor ON (casting.actorid=actor.id)
WHERE casting.ord = 1 AND casting.movieid=ANY(
SELECT casting.movieid FROM casting
WHERE casting.actorid IN (
  SELECT actor.id FROM actor
  WHERE name='Julie Andrews'));

-- 13. actors with 30 leading roles

SELECT actor.name
FROM casting JOIN actor ON (casting.actorid=actor.id)
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.ord) >=30
ORDER BY actor.name

-- 14. Films 1978

SELECT movie.title, COUNT(casting.actorid)
FROM movie JOIN casting ON (casting.movieid=movie.id)
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title

-- 15. people who have worked at Art Garfunkel

SELECT actor.name FROM actor
JOIN casting ON (actor.id=casting.actorid)
JOIN movie ON (casting.movieid=movieid)
WHERE actor.name!='Art Garfunkel' AND casting.movieid=ANY(
SELECT casting.movieid FROM casting
WHERE casting.actorid=
(SELECT actor.id FROM actor WHERE actor.name='Art Garfunkel'))
GROUP BY actor.name;