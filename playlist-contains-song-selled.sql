WITH PlaylistTrackSales AS (
    SELECT
        pt.PlaylistId,
        pt.Name AS PlaylistName,
        t.TrackId,
        SUM(IFNULL(il.InvoiceLineId, 0)) AS SalesCount
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
        SUM(IF(ps.SalesCount >= 2, 1, 0)) * 100.0 / COUNT(ps.TrackId),
        2
    ) AS "% Song Sold Twice"
FROM PlaylistTrackSales ps
GROUP BY ps.PlaylistId, ps.PlaylistName
ORDER BY ps.PlaylistId;
