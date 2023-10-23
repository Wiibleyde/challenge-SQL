SELECT Artist.Name, count(*) AS NbAlbums, 
	CASE
		WHEN count(*) = 1 THEN 'Unproductive'
		WHEN count(*) > 1 AND count(*) < 10 THEN 'Productive'
		ELSE 'Very Productive'
	END as IsProductive
FROM albums
Join (SELECT * FROM artists) AS Artist ON albums.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistId LIMIT 100;	