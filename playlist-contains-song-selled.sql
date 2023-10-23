SELECT
    pt.PlaylistId,
    pt.Name AS PlaylistName,
    ROUND(
        (SUM(CASE WHEN il.InvoiceLineId IS NOT NULL THEN 1 ELSE 0 END) >= 2) * 100.0 / COUNT(t.TrackId),
        2
    ) AS "% Song Sold Twice"
FROM playlists pt
JOIN playlist_track ptt ON pt.PlaylistId = ptt.PlaylistId
JOIN tracks t ON ptt.TrackId = t.TrackId
LEFT JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY pt.PlaylistId, pt.Name
ORDER BY pt.PlaylistId;
