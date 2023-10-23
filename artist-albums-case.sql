SELECT a.Name AS Name, COUNT(al.AlbumId) AS NbAlbums,
    CASE
        WHEN COUNT(al.AlbumId) = 1 THEN 'Unproductive'
        WHEN COUNT(al.AlbumId) > 1 AND COUNT(al.AlbumId) < 10 THEN 'Productive'
        WHEN COUNT(al.AlbumId) >= 10 THEN 'Very Productive'
    END AS IsProductive
FROM artists a
LEFT JOIN albums al ON a.ArtistId = al.ArtistId
GROUP BY a.ArtistId LIMIT 100;
