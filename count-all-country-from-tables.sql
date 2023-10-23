SELECT
    Country,
    SUM(Total) AS Total,
    SUM(Employees) AS Employees,
    SUM(Customers) AS Customers,
    SUM(Invoices) AS Invoices
FROM (
    SELECT Country, 0 AS Total, COUNT(*) AS Employees, 0 AS Customers, 0 AS Invoices
    FROM employees
    GROUP BY Country

    UNION ALL

    SELECT Country, 0 AS Total, 0 AS Employees, COUNT(*) AS Customers, 0 AS Invoices
    FROM customers
    GROUP BY Country

    UNION ALL

    SELECT BillingCountry AS Country, 0 AS Total, 0 AS Employees, 0 AS Customers, COUNT(*) AS Invoices
    FROM invoices
    GROUP BY BillingCountry
) AS CombinedData
GROUP BY Country
ORDER BY Country;
