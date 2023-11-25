-- Как это можно упростить?
SELECT Employees.FullName                                                AS EmployeeFullNames,
       ROUND(SUM(Positions.Salary * Salaries.SalaryPercentage)) AS SumSalary
FROM Salaries
         JOIN Employees ON Salaries.EmployeeID = Employees.ID
         JOIN Positions ON Salaries.PositionID = Positions.ID
GROUP BY Employees.ID
HAVING SumSalary < (
-- Определение средней общей зарплаты
    SELECT AVG(TotalSalary)
    FROM (
             -- Выбор общей зарплаты сотрудников
             SELECT Employees.ID,
                    ROUND(SUM(Positions.Salary * Salaries.SalaryPercentage)) AS TotalSalary
             FROM Employees
                      JOIN Salaries ON Employees.ID = Salaries.EmployeeID
                      JOIN Positions ON Salaries.PositionID = Positions.ID
             GROUP BY Employees.ID) AS AverageSalary)
ORDER BY SUM(DISTINCT Positions.Salary * Salaries.SalaryPercentage);