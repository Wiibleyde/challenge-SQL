SELECT
    p.PlaylistId,
    p.Name,
    ROUND(
        SUM(CASE WHEN il.Quantity >= 2 THEN 1 ELSE 0 END) * 100.0 / COUNT(pt.TrackId),
        4
    ) AS "% song selled twice"
FROM playlists p
LEFT JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
LEFT JOIN invoice_items il ON pt.TrackId = il.TrackId
GROUP BY p.PlaylistId, p.Name
ORDER BY p.PlaylistId;
