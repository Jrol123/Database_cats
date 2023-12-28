SELECT B.Name             AS 'BEAST.NAME',
       COUNT(ContinentID) AS COUNT
-- Переименование места в континент + группировка по зверям.
FROM (SELECT BEAST, C.ROWI as ContinentID
      FROM ENCOUNTERS
               JOIN main.PLACES P on ENCOUNTERS.PLACE = P.ROWI
               JOIN main.CONTINENTS C on P.CONT = C.ROWI
      GROUP BY BEAST, ContinentID
      ORDER BY BEAST) as beast_continent
         JOIN main.BEASTS B on B.ROWI = beast_continent.BEAST
GROUP BY B.Name
HAVING COUNT > 1
ORDER BY B.Name ASC;
