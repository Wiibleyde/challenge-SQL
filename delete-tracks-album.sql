DELETE FROM tracks
WHERE AlbumId IN (SELECT AlbumId FROM albums WHERE Title = 'Facelift');
