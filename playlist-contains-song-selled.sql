WITH SoldTwice AS (
    SELECT
        pt.PlaylistId,
        il.TrackId
    FROM invoice_items il
    INNER JOIN playlist_track pt ON il.TrackId = pt.TrackId
    WHERE il.Quantity >= 2
)

SELECT
    p.PlaylistId,
    p.Name,
    ROUND(COALESCE(
        (CAST(COUNT(st.TrackId) AS REAL) / CAST(COUNT(pt.TrackId) AS REAL)) * 100,
        0
    ), 4) AS "% song selled twice"
FROM playlists p
LEFT JOIN SoldTwice st ON p.PlaylistId = st.PlaylistId
LEFT JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
GROUP BY p.PlaylistId, p.Name
ORDER BY p.PlaylistId;
