SELECT Tracks.Name AS Name
FROM Tracks
JOIN (
    SELECT InvoiceId
    FROM Invoices
    ORDER BY InvoiceDate DESC
    LIMIT 1
) AS LastInvoice
ON LastInvoice.InvoiceId = invoice_items.InvoiceId
JOIN invoice_items ON invoice_items.TrackId = Tracks.TrackId;
