WITH PlaylistTrackSales AS (
    SELECT
        pt.PlaylistId,
        pt.Name AS PlaylistName,
        t.TrackId,
        SUM(CASE WHEN il.InvoiceLineId IS NOT NULL THEN 1 ELSE 0 END) AS SalesCount
    FROM playlists pt
    JOIN playlist_track ptt ON pt.PlaylistId = ptt.PlaylistId
    JOIN tracks t ON ptt.TrackId = t.TrackId
    LEFT JOIN invoice_items il ON t.TrackId = il.TrackId
    GROUP BY pt.PlaylistId, pt.Name, t.TrackId
)

SELECT
    ps.PlaylistId,
    ps.PlaylistName,
    ROUND(
        (SUM(CASE WHEN ps.SalesCount >= 2 THEN 1 ELSE 0 END) * 100.0) / COUNT(ps.TrackId),
        2
    ) AS "% Song Sold Twice"
FROM PlaylistTrackSales ps
GROUP BY ps.PlaylistId, ps.PlaylistName
ORDER BY ps.PlaylistId;
