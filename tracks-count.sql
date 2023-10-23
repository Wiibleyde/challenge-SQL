SELECT genres.Name, COUNT(tracks.TrackId) AS NumberOfTracks FROM genres
LEFT JOIN tracks ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name;
