SELECT t.* FROM tracks t WHERE t.AlbumId IN (SELECT a.AlbumId FROM albums a WHERE a.Title IN (SELECT g.Name FROM genres g));
