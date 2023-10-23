SELECT
    i.InvoiceId,
    SUM(ii.UnitPrice) / COUNT(ii.TrackId) AS "Average Cost by Songs",
    SUM(t.Milliseconds) / 1000 AS "Total Length of Songs (Seconds)",
	ROUND(SUM(ii.UnitPrice) / (SUM(t.Milliseconds) / 6000.0), 5) AS "Cost of Songs per Second (Euros/Second)"
FROM invoices i
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks t ON ii.TrackId = t.TrackId
GROUP BY i.InvoiceId;
