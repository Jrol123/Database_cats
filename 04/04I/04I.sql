-- Выбор пациентов по заболеванию + по департаменту
SELECT Department.id, Alterego.Name, COUNT(Patient.Id) as count
FROM Alterego
         JOIN Patient ON Alterego.id = Patient.Alterego
         JOIN Department ON Department.id = Patient.Department
GROUP BY Alterego.Name, Department.id
-- Если количество пациентов с заболеванием равно максимальному количеству в департаменте
HAVING COUNT(Patient.Id) = (SELECT MAX(count)
                            FROM ( -- Подсчёт пациентов по департаментам
                                     SELECT Department.Id AS department_id, COUNT(Patient.Id) AS count
                                     FROM Alterego
                                              JOIN Patient ON Alterego.id = Patient.Alterego
                                              JOIN Department ON Department.id = Patient.Department
                                     GROUP BY Patient.Alterego, Department.id) as otvet
                            WHERE otvet.department_id = Department.Id)
ORDER BY Department.id ASC, Alterego.Name ASC
LIMIT 2000;
