SELECT t.*
FROM tracks t
JOIN albums a ON t.AlbumId = a.AlbumId
JOIN genres g ON a.Title = g.Name;
