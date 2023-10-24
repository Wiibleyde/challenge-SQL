SELECT
    employees.LastName,
    employees.FirstName,
    COALESCE(
        (
            SELECT COUNT(invoices.CustomerId)
            FROM customers
            JOIN invoices ON customers.CustomerId = invoices.CustomerId
        ), '-'
    ) AS 'Total Sell',
    COALESCE(
        (
            SELECT COUNT(invoices.CustomerId)
            FROM customers
            JOIN invoices ON customers.CustomerId = invoices.CustomerId
            WHERE customers.SupportRepId = employees.EmployeeId
        ), '-'
    ) AS 'Total Sell By Employee',
    COALESCE(
        (
            SELECT c.Country
            FROM customers c
            JOIN invoices i ON c.CustomerId = i.CustomerId
            WHERE c.SupportRepId = employees.EmployeeId
            GROUP BY c.Country
            ORDER BY COUNT(i.CustomerId) DESC
            LIMIT 1
        ), '-'
    ) AS 'Country With Most Sales',
    COALESCE(
        (
            SELECT g.Name
            FROM genres g
            JOIN tracks t ON g.GenreId = t.GenreId
            JOIN invoice_items ii ON t.TrackId = ii.TrackId
            JOIN invoices i ON ii.InvoiceId = i.InvoiceId
            JOIN customers c ON i.CustomerId = c.CustomerId
            WHERE c.SupportRepId = employees.EmployeeId
            GROUP BY g.Name
            ORDER BY COUNT(ii.InvoiceLineId) DESC
            LIMIT 1
        ), '-'
    ) as 'Most Genre Selled',
    COALESCE(
        (
            SELECT mt.Name
            FROM media_types mt
            JOIN tracks t2 ON mt.MediaTypeId = t2.MediaTypeId
            JOIN invoice_items ii2 ON t2.TrackId = ii2.TrackId
            JOIN invoices i ON ii2.InvoiceId = i.InvoiceId
            JOIN customers c ON i.CustomerId = c.CustomerId
            WHERE c.SupportRepId = employees.EmployeeId
            GROUP BY mt.Name
            ORDER BY COUNT(ii2.InvoiceLineId) DESC
            LIMIT 1
        ), '-'
    ) as 'Most Media Type Selled',
    (SELECT CASE
                WHEN Result = 0 OR Result = 100 THEN '-'
                ELSE ROUND(Result, 2)
                END AS "Percentage sales compared best seller"
     FROM (SELECT (SELECT COUNT(*)
                   FROM invoices i
                            JOIN customers c ON i.CustomerId = c.CustomerId
                   WHERE c.SupportRepId = employees.EmployeeId) * 100.0 /
                  (SELECT 146
                   FROM (SELECT c.SupportRepId, SUM(ii.Quantity) AS EmployeeTotalSales
                         FROM invoices i
                                  JOIN customers c ON i.CustomerId = c.CustomerId
                                  JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
                         GROUP BY c.SupportRepId) AS subquery) AS Result) AS Subquery
     )AS "Percentage sales compared best seller"
FROM employees ;
