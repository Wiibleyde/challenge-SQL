SELECT FirstName, LastName,
    (CAST(STRFTIME('%Y', 'now') AS INTEGER) - CAST(SUBSTR(BirthDate, 1, 4) AS INTEGER) -
    CASE WHEN STRFTIME('%m-%d', 'now') < SUBSTR(BirthDate, 6, 5) THEN 1 ELSE 0 END) AS ApproximateAge
FROM employees
ORDER BY ApproximateAge ASC;
