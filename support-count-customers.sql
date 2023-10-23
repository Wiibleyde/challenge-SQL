SELECT employees.LastName || ' ' || UPPER(employees.LastName) AS FullName, COUNT(customers.CustomerId) AS NumberOfCustomers FROM employees
LEFT JOIN customers ON employees.EmployeeId = customers.SupportRepId
WHERE employees.Title = 'Sales Support Agent' GROUP BY employees.EmployeeId ORDER BY NumberOfCustomers ASC;
