SELECT DISTINCT i.InvoiceId
FROM invoices i
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN (
    SELECT t.TrackId, g.GenreId
    FROM tracks t
    JOIN genres g ON t.GenreId = g.GenreId
    WHERE t.Milliseconds = (
        SELECT MAX(Milliseconds)
        FROM tracks
        WHERE GenreId = g.GenreId
    )
) AS longest_tracks ON ii.TrackId = longest_tracks.TrackId;
