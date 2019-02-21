SELECT A.*

FROM(SELECT
		(SELECT Cat.CustomerCategoryName
		FROM Sales.CustomerCategories as Cat
		WHERE Cu.CustomerCategoryID = Cat.CustomerCategoryID) as CustomerCategoryName,

		(SELECT
			(SELECT SUM(OL.Quantity * OL.UnitPrice) 
			FROM Sales.Orders as O, Sales.OrderLines as OL
			WHERE Cu.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID)
			-
			(SELECT SUM(IL.Quantity * IL.UnitPrice) 
			FROM Sales.Invoices as I, Sales.InvoiceLines as IL
			WHERE Cu.CustomerID = I.CustomerID AND I.InvoiceID = IL.InvoiceID)) as MaxLoss,
		Cu.CustomerName,
		Cu.CustomerID
	FROM Sales.Customers as Cu) as A

WHERE A.MaxLoss in (SELECT B.MaxLoss	
					FROM(SELECT DISTINCT A.CustomerCategoryName, MAX(A.MaxLoss) as MaxLoss
						FROM (SELECT 
								(SELECT Cat.CustomerCategoryName
								FROM Sales.CustomerCategories as Cat
								WHERE Cu.CustomerCategoryID = Cat.CustomerCategoryID) as CustomerCategoryName,

								(SELECT
									(SELECT SUM(OL.Quantity * OL.UnitPrice) 
									FROM Sales.Orders as O, Sales.OrderLines as OL
									WHERE Cu.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID)
									-
									(SELECT SUM(IL.Quantity * IL.UnitPrice) 
									FROM Sales.Invoices as I, Sales.InvoiceLines as IL
									WHERE Cu.CustomerID = I.CustomerID AND I.InvoiceID = IL.InvoiceID)) as MaxLoss,
								Cu.CustomerName,
								Cu.CustomerID
		
							FROM Sales.Customers as Cu) as A 
					GROUP BY A.CustomerCategoryName) as B)
ORDER BY MaxLoss DESC;
