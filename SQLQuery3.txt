CREATE PROCEDURE ReportCustomerTurnover 
	@Choice INT = 1,
	@Year INT = 2013
AS
BEGIN
	IF @Choice = 1 
		BEGIN
			SELECT
					Cu.CustomerName,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 01
					),0) as Jan,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 02
					),0) as Feb,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 03
					),0) as Mar,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 04
					),0) as Apr,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 05
					),0) as May,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 06
					),0) as Jun,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 07
					),0) as Jul,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 08
					),0) as Aug,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 09
					),0) as Sep,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 10
					),0) as Oct,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 11
					),0) as Nov,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) = 12
					),0) as [Dec]

			FROM Sales.Customers as Cu
			ORDER BY Cu.CustomerName
		END
	
	ELSE IF @Choice = 2
		BEGIN
			SELECT
					Cu.CustomerName,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) between 01 and 03
					),0) as Q1,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) between 04 and 06
					),0) as Q2,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) between 07 and 09
					),0) as Q3,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = @Year
								AND MONTH(i.InvoiceDate) between 10 and 12
					),0) as Q4

			FROM Sales.Customers as Cu
			ORDER BY Cu.CustomerName
		END

	ELSE IF @Choice = 3
		BEGIN
			SELECT
					Cu.CustomerName,
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = 2013
					),0) as '2013',
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = 2014
					),0) as '2014',
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = 2015
					),0) as '2015',
					ISNULL((
						SELECT	SUM(il.Quantity * il.UnitPrice)
						FROM	Sales.Invoices as i,
								Sales.InvoiceLines as il
						WHERE
								cu.CustomerID = i.CustomerID
								AND il.InvoiceID = i.InvoiceID
								AND YEAR(i.InvoiceDate) = 2016
					),0) as '2016'

			FROM Sales.Customers as Cu
			ORDER BY Cu.CustomerName
		END
END;
