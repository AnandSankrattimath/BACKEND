--Assignement 6.1
CREATE VIEW vWGetRankOfProducts
AS
SELECT DP.ProductKey,DP.ProductName,FS.SalesAmount,
RANK() OVER( PARTITION BY DP.ProductName ORDER BY FS.salesamount DESC) AS RANK,
DENSE_RANK() OVER ( PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS DENSE_RANK,
ROW_NUMBER() OVER ( PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS ROW_NUMBER
FROM dbo.DimProduct AS DP INNER JOIN dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%' AND FS.SalesAmount>10000

SELECT * from vWGetRankOfProducts


--Assignment 6.2
ALTER PROC spExecuteAggregateFunctions
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

	SELECT * INTO dbo.#tmpRankProducts FROM vWGetRankOfProducts
	
	SELECT * FROM dbo.#tmpRankProducts

	DROP TABLE dbo.#tmpRankProducts

END

 spExecuteAggregateFunctions '%420%'


--Assignment 6.3
sp_helptext spExecuteAggregateFunctions;

sp_helptext vWGetRankOfProducts;

--Assignment 6.4

SELECT * FROM sys.objects WHERE NAME = 'vWGetRankOfProducts';
SELECT * FROM sys.objects WHERE NAME = 'spExecuteAggregateFunctions';

SELECT * FROM syscomments WHERE id = 606625204;  

SELECT * FROM syscomments WHERE id = 654625375;


--Assignment 6.5
EXECUTE spExecuteAggregateFunctions '%420%'

