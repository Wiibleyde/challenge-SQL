SELECT
    p.PlaylistId,
    p.Name,
    ROUND(
        (COUNT(DISTINCT il.TrackId) * 100.0) / (SELECT COUNT(DISTINCT TrackId) FROM invoice_items),
        4
    ) AS "% song selled twice"
FROM playlists p
LEFT JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
LEFT JOIN invoice_items il ON pt.TrackId = il.TrackId
GROUP BY p.PlaylistId, p.Name
ORDER BY p.PlaylistId;
