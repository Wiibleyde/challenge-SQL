SELECT
    p.PlaylistId,
    p.Name,
    ROUND(
        COALESCE(
            (CAST(COUNT(DISTINCT il.TrackId) AS REAL) / COUNT(DISTINCT pt.TrackId)) * 100,
            0
        ),
        4
    ) AS "% song selled twice"
FROM playlists p
LEFT JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
LEFT JOIN invoice_items il ON pt.TrackId = il.TrackId AND il.Quantity >= 2
GROUP BY p.PlaylistId, p.Name
ORDER BY p.PlaylistId;
