SELECT i.InvoiceId AS InvoiceId, t.Name AS InvoiceItem, it.UnitPrice FROM invoices i
JOIN invoice_items it ON i.InvoiceId = it.InvoiceId JOIN tracks t ON it.TrackId = t.TrackId
WHERE i.InvoiceId = 10 ORDER BY t.Name ASC;
