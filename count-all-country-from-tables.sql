WITH AllCountries AS (
    SELECT Country FROM employees
    UNION ALL
    SELECT Country FROM customers
    UNION ALL
    SELECT BillingCountry AS Country FROM invoices
)

SELECT
    Country,
    COUNT(DISTINCT CASE WHEN TableName = 'employees' THEN RowId END) AS Employees,
    COUNT(DISTINCT CASE WHEN TableName = 'customers' THEN RowId END) AS Customers,
    COUNT(DISTINCT CASE WHEN TableName = 'invoices' THEN RowId END) AS Invoices,
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
