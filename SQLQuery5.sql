SELECT
	Cu.CustomerId,
	Cu.CustomerName
FROM dbo.Customer as Cu INNER JOIN dbo.Purchase as Pu
	ON Cu.CustomerId = Pu.CustomerId
GROUP BY Cu.CustomerId, Cu.CustomerName
HAVING 
	SUM(Pu.Qty) > 50
	AND COUNT(Pu.ProductId) = COUNT(DISTINCT Pu.ProductId);
