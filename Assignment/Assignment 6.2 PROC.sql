
CREATE PROC spExecuteAggregateFunctions
@ProductName varchar(10)
AS
BEGIN
	SELECT DP.ProductName,
	MAX(FS.SalesAmount) AS MAX_SALES_AMOUNT,
	MIN(FS.SalesAmount) AS MIN_SALES_AMOUNT,
	AVG(FS.SalesAmount) AS AVG_SALES_AMOUNT,
	SUM(FS.SalesAmount) AS SUM_SALES_AMOUNT,
	COUNT(FS.SalesAmount) AS CNT_SALES_AMOUNT
	FROM dbo.DimProduct AS DP
	INNER JOIN
	dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
	WHERE DP.ProductName LIKE @ProductName
	GROUP BY DP.ProductName
	HAVING Sum(FS.SalesAmount) > 10000
	ORDER BY DP.ProductName DESC;
END

EXECUTE spExecuteAggregateFunctions '%420%'
