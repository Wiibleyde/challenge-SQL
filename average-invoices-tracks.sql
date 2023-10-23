SELECT
    i.InvoiceId,
    SUM(ii.UnitPrice) / COUNT(ii.TrackId) AS 'Average Price',
    SUM(t.Milliseconds) / 1000 AS 'Track Total Time',
    ROUND((SUM(ii.UnitPrice) / COUNT(ii.TrackId)) / (SUM(t.Milliseconds) / 1000), 5) || '€' AS 'Price by second'
FROM invoices i
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId 
JOIN tracks t ON ii.TrackId = t.TrackId
GROUP BY i.InvoiceId;
