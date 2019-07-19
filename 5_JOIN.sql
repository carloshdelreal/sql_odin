-- 1. Goals of Germany

SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

-- 2. Game 1012

SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

-- 3. Match ID German Goals

SELECT player, teamid,stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4. Mario Goals

SELECT team1, team2, player 
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 5. Goal time and coach

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam on teamid=id
WHERE gtime<10

-- 6. Coach Fernando Santos

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

-- 7. goals in Warsaw

SELECT player
FROM game JOIN goal ON id=matchid
WHERE stadium = 'National Stadium, Warsaw'

-- More difficult questions
-- 8. Goals to Germany

SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER')
AND teamid <> 'GER'

-- 9. Goals by team

SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10. Goals by Stadium

SELECT stadium, COUNT(*)
FROM game JOIN goal ON id=matchid
GROUP BY stadium

-- 11. Goals scored when plays poland

SELECT goal.matchid, game.mdate, COUNT(goal.matchid)
FROM goal JOIN game ON goal.matchid = game.id 
WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY goal.matchid, game.mdate;

-- 12. Goals of Germany

SELECT game.id, game.mdate, count(goal.matchid)
FROM game JOIN goal ON id=matchid
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate

-- 13. Goals by each team

SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;


