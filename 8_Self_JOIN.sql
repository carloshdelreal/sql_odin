-- 1.  Stops 

SELECT COUNT(*) FROM stops


-- 2. stop 'Craiglockhart'

SElECT id FROM stops
WHERE name = 'Craiglockhart'

-- 3. routes

SELECT stops.id, stops.name
FROM stops
INNER JOIN route
ON stops.id = route.stop
WHERE route.num = 4
AND route.company = 'LRT';

-- 4. Havin more than two

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) >= 2

-- 5. Criptic FROM Craiglockhart to London Road

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = 149;

-- 6. FROM Craiglockhart to London Road

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name =  'London Road' 

-- 7. Routes that connect

SELECT a.company, a.num
FROM route a JOIN route b 
	ON(a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137
GROUP BY a.company, a.num;

-- 8. From Craiglockhart to Tollcross

SELECT a.company, a.num
FROM route a JOIN route b 
	ON(a.company = b.company AND a.num = b.num)
WHERE a.stop = (SELECT stops.id FROM stops WHERE name ='Craiglockhart') 
AND b.stop = (SELECT stops.id FROM stops WHERE name ='Tollcross') 
GROUP BY a.company, a.num;

-- 9. list of the stops which may be reached from 'Craiglockhart' by taking one bus

SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';


-- 10. Find the routes involving two buses that can go from Craiglockhart to Lochend

SELECT a.num, a.company, stopc.name AS transfer, 
       c.num, c.company
FROM route a 
  JOIN route b ON (a.company = b.company 
                   AND a.num = b.num)
  JOIN route c 
  JOIN route d ON (c.company = d.company 
                   AND c.num = d.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopc ON c.stop = stopc.id
JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart'
  AND stopd.name = 'Lochend'
  AND stopb.name = stopc.name;