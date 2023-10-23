SELECT 
	p.PlaylistId,
	p.Name,
	IFNULL(ROUND((SelledTwiceByPlaylist*1.0 / NbSongPlaylist*1.0) * 100.0, 3),0) AS '% song selled twice'
FROM playlists p
    LEFT JOIN 
        (
            (
                SELECT PlaylistId, COUNT(*) AS SelledTwiceByPlaylist FROM (SELECT TrackId FROM (
                    SELECT TrackId, COUNT(*) AS CountSell FROM invoice_items GROUP BY TrackId) WHERE CountSell=2
                ) SelledTwice
            INNER JOIN playlist_track pt ON pt.TrackId = SelledTwice.TrackId GROUP BY PlaylistId ORDER BY PlaylistId)
        ) SelledTwiceByPlaylist ON SelledTwiceByPlaylist.PlaylistId=p.PlaylistId
    LEFT JOIN 
        (
            SELECT PlaylistId, COUNT(*) AS NbSongPlaylist FROM playlist_track GROUP BY PlaylistId
        ) NbSongPlaylist ON NbSongPlaylist.PlaylistId=p.PlaylistId
GROUP BY p.PlaylistId
