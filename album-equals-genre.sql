SELECT *
FROM tracks
WHERE AlbumId IN (
    SELECT albums.AlbumId
    FROM albums
    WHERE albums.Title IN (
        SELECT genres.Name
        FROM genres
    )
);
