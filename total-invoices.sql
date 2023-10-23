SELECT FirstName || ' ' || UPPER(LastName) AS FullName, SUM(invoices.Total) AS AllInvoices FROM Customers
JOIN invoices ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId HAVING AllInvoices > 38 ORDER BY FullName ASC;
