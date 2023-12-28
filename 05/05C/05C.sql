-- По условию требуется создать представление
CREATE VIEW ShowITEmployees AS
WITH RECURSIVE ShowITEmployees AS (SELECT Employees.ID,
                                          Employees.FullName,
                                          Positions.Title AS Position,
                                          Employees.ChiefID
                                   FROM Employees
                                            LEFT JOIN Positions ON Employees.PositionID = Positions.ID
                                   WHERE Positions.Title = 'PC Principal'
                                   -- Выбор PC Principal

                                   UNION

                                   SELECT Emp.ID, Emp.FullName, p.Title, Emp.ChiefID
                                   FROM Employees Emp
                                            -- Могут быть сотрудники без позиций
                                            LEFT JOIN Positions p ON Emp.PositionID = p.ID
                                            JOIN ShowITEmployees it ON Emp.ChiefID = it.ID)
SELECT *
FROM ShowITEmployees