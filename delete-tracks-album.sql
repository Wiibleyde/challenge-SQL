SELECT AlbumId
FROM albums
WHERE Title = 'Facelift';

DELETE FROM tracks
WHERE AlbumId = (
    SELECT AlbumId
    FROM albums
    WHERE Title = 'Facelift'
);
