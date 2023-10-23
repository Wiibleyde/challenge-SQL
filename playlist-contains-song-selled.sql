SELECT
    pt.PlaylistId AS PlaylistId,
    pt.Name AS PlaylistName,
    ROUND(
        (SUM(CASE WHEN il.InvoiceLineId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(t.TrackId),
        2
    ) AS "% Song Sold Twice"
FROM playlists AS pt
JOIN playlist_track AS ptt ON pt.PlaylistId = ptt.PlaylistId
JOIN tracks AS t ON ptt.TrackId = t.TrackId
LEFT JOIN invoice_items AS il ON t.TrackId = il.TrackId
GROUP BY pt.PlaylistId, pt.Name
ORDER BY pt.PlaylistId;
