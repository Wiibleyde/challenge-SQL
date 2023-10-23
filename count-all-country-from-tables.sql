WITH AllCountries AS (
    SELECT Country FROM employees
    UNION ALL
    SELECT Country FROM customers
    UNION ALL
    SELECT BillingCountry AS Country FROM invoices
)

SELECT
    Country,
	COUNT(*) AS Total,
    (SELECT COUNT(*) FROM employees e WHERE e.Country = AllCountries.Country) AS Employees,
	(SELECT COUNT(*) FROM customers c WHERE c.Country = AllCountries.Country) AS Customers,
    (SELECT COUNT(*) FROM invoices i WHERE i.BillingCountry = AllCountries.Country) AS Invoices
FROM AllCountries
GROUP BY Country ORDER BY Country;
