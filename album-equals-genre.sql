SELECT *
FROM tracks
WHERE albumId IN (SELECT genreId FROM genres);
