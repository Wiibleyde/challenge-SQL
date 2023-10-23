SELECT Country, COUNT(*) AS Count
FROM (
    SELECT Country FROM employees
    UNION ALL
    SELECT Country FROM customers
    UNION ALL
    SELECT BillingCountry AS Country FROM invoices
) AS AllCountries
GROUP BY Country
ORDER BY Country;
