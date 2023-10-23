SELECT
    a.Name AS ArtistName,
    al.Title AS AlbumName,
    t.Name AS TrackName,
    ROUND(CAST(t.Bytes AS REAL) / (1000*1000), 2) || ' MB' AS MegaBytes
FROM
    tracks t
    JOIN albums al ON t.AlbumId = al.AlbumId
    JOIN artists a ON al.ArtistId = a.ArtistId
WHERE
    al.Title = 'American Idiot';
