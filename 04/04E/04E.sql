SELECT Departments.Name AS Department,
    COUNT(Employees.ID) AS TotalPeople
FROM Departments
LEFT JOIN Employees ON Departments.ID = Employees.DepartmentID
GROUP BY Departments.ID;