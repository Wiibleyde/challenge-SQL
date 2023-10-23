SELECT
    E1.EmployeeId AS EmployeeId,
    E1.FirstName || ' ' || E1.LastName AS EmployeeName,
    E2.FirstName || ' ' || E2.LastName AS ReportsTo
FROM employees AS E1
LEFT JOIN employees AS E2 ON E1.ReportsTo = E2.EmployeeId;
