SELECT
	Cu.CustomerID,
	Cu.CustomerName,

	(	SELECT COUNT(DISTINCT O.OrderID)
		FROM Sales.Orders as O, Sales.Invoices as I
		WHERE Cu.CustomerID = O.CustomerID AND O.OrderID = I.OrderID) as TotalNBOrders,

	(	SELECT COUNT(DISTINCT I.InvoiceID) 
		FROM Sales.Orders as O, Sales.Invoices as I
		WHERE Cu.CustomerID = I.CustomerID AND O.OrderID = I.OrderID) as TotalNBInvoices,

	(	SELECT SUM(OL.Quantity * OL.UnitPrice) 
		FROM Sales.Invoices as I, Sales.Orders as O, Sales.OrderLines as OL
		WHERE Cu.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID AND O.OrderID = I.OrderID) as OrdersTotalValue,

	(	SELECT SUM(IL.Quantity * IL.UnitPrice) 
		FROM Sales.Invoices as I, Sales.Orders as O, Sales.InvoiceLines as IL
		WHERE Cu.CustomerID = I.CustomerID AND I.InvoiceID = IL.InvoiceID AND O.OrderID = I.OrderID) as InvoicesTotalValue,

	(	SELECT
			(	SELECT SUM(IL.Quantity * IL.UnitPrice) 
				FROM Sales.Invoices as I, Sales.Orders as O, Sales.InvoiceLines as IL
				WHERE Cu.CustomerID = I.CustomerID AND I.InvoiceID = IL.InvoiceID AND O.OrderID = I.OrderID)
				-
			(	SELECT SUM(OL.Quantity * OL.UnitPrice) 
				FROM Sales.Invoices as I, Sales.Orders as O, Sales.OrderLines as OL
				WHERE Cu.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID AND O.OrderID = I.OrderID)
	) as AbsoluteValueDifference

FROM Sales.Customers as Cu
ORDER BY AbsoluteValueDifference DESC, TotalNBOrders, Cu.CustomerName;