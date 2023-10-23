SELECT e3.LastName || ' ' || e3.FirstName AS '3rd best seller'
FROM employees AS e1
JOIN employees AS e2 ON e1.EmployeeId = e2.ReportsTo
JOIN employees AS e3 ON e2.EmployeeId = e3.ReportsTo
GROUP BY e3.EmployeeId
ORDER BY COUNT(e1.EmployeeId) DESC, e3.EmployeeId
LIMIT 1 OFFSET 2;