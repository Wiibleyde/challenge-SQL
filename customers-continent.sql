SELECT FirstName, LastName, Country,
    CASE
        WHEN Country IN ('United States', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'Peru') THEN 'America'
        WHEN Country IN ('China', 'Japan', 'India', 'South Korea', 'Thailand') THEN 'Asia'
        WHEN Country IN ('United Kingdom', 'Germany', 'France', 'Italy', 'Spain', 'Norway') THEN 'Europe'
        WHEN Country IN ('Australia', 'New Zealand') THEN 'Oceania'
        ELSE 'Other'
    END AS Continent
FROM Customers;
