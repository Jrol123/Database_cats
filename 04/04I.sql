SELECT Department.ID, A.Name, COUNT(Alterego) AS Count
FROM Department
         JOIN main.Patient P on Department.Id = P.Department
         JOIN main.Alterego A on A.Id = P.Alterego
GROUP BY Department.ID, A.Name
ORDER BY Department.Id, Count DESC;

-- Как брать самое большое значение по департаменту?
-- Фильтровать в Join ?
-- Как идея...

-- Нужно как-то брать максимальное количество и по нему уже работать

-- Можно брать MAX COUNT Alterego, затем по нему выбирать записи и выводить

SELECT COUNT(DISTINCT A)

SELECT D.ID, Alterego, COUNT(DISTINCT Alterego) AS Count
FROM Patient
         JOIN main.Department D on D.Id = Patient.Department
GROUP BY D.ID;
