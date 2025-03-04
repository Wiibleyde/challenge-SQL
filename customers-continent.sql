SELECT FirstName, LastName, Country,
    CASE
        WHEN Country IN ('USA', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'Peru', 'Chile') THEN 'America'
        WHEN Country IN ('China', 'Japan', 'India', 'South Korea', 'Thailand') THEN 'Asia'
        WHEN Country IN ('United Kingdom', 'Germany', 'France', 'Italy', 'Spain', 'Norway', 'Austria', 'Belgium', 'Czech Republic', 'Denmark', 'Portugal', 'Finland', 'Hungary', 'Ireland', 'Netherlands', 'Poland', 'Sweden') THEN 'Europe'
        WHEN Country IN ('Australia', 'New Zealand') THEN 'Oceania'
        ELSE 'Other'
    END AS Continent
FROM Customers;
