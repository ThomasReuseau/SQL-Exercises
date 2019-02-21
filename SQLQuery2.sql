-- Identify the first InvoiceLine of the first Invoice of customer with ID 1060

SELECT TOP (1) IL.InvoiceID, IL.InvoiceLineID, IL.UnitPrice, IL.Quantity
FROM 
	Sales.InvoiceLines as IL,
	Sales.Invoices as I
WHERE 
	I.InvoiceID = IL.InvoiceID
	AND I.CustomerID = '1060'
ORDER BY IL.InvoiceID, IL.InvoiceLineID;

-- Update the Database with InvoiceID 69627 & InvoiceLineID 225394

UPDATE Sales.InvoiceLines SET UnitPrice += 20
FROM 
	Sales.Invoices as I,
	Sales.InvoiceLines as IL
WHERE 
	I.InvoiceID = IL.InvoiceID
	AND I.CustomerID = '1060'
	AND IL.InvoiceID ='69627'
	AND IL.InvoiceLineID ='225394';