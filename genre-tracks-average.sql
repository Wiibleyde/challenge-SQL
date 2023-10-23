SELECT genres.Name, AVG(tracks.Milliseconds) AS AverageDuration
FROM genres
LEFT JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name
ORDER BY AverageDuration DESC;
