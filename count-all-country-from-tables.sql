SELECT
    Country,
    COUNT(DISTINCT CASE WHEN TableName = 'employees' THEN RowId ELSE NULL END) AS Employees,
    COUNT(DISTINCT CASE WHEN TableName = 'customers' THEN RowId ELSE NULL END) AS Customers,
    COUNT(DISTINCT CASE WHEN TableName = 'invoices' THEN RowId ELSE NULL END) AS Invoices,
    COUNT(*) AS Total
FROM (
    SELECT
        Country,
        'employees' AS TableName,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY NULL) AS RowId
    FROM employees

    UNION ALL

    SELECT
        Country,
        'customers' AS TableName,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY NULL) AS RowId
    FROM customers

    UNION ALL

    SELECT
        BillingCountry AS Country,
        'invoices' AS TableName,
        ROW_NUMBER() OVER (PARTITION BY BillingCountry ORDER BY NULL) AS RowId
    FROM invoices
) AS CombinedData
GROUP BY Country
ORDER BY Country;
