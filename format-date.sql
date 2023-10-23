SELECT EmployeeId, LastName, FirstName, STRFTIME('%d/%m/%Y', HireDate) AS HireFrenchDate FROM Employees ORDER BY HireDate ASC;
