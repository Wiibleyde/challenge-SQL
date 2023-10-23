SELECT c.CustomerID, c.FirstName, c.LastName, AVG(i.Total) AS InvoicesAverage
FROM Customers c
JOIN Invoices i ON c.CustomerID = i.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName ORDER BY c.FirstName ASC;
