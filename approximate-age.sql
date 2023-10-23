SELECT FirstName, LastName, strftime('%Y', HireDate) - strftime('%Y', BirthDate) AS ApproximateAge
FROM Employees
ORDER BY ApproximateAge ASC;
