

CREATE VIEW vWGetRankOfProducts
AS
SELECT DP.ProductKey,DP.ProductName,FS.SalesAmount,
RANK() OVER( PARTITION BY DP.ProductName ORDER BY FS.salesamount DESC) AS RANK,
DENSE_RANK() OVER ( PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS DENSE_RANK,
ROW_NUMBER() OVER ( PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS ROW_NUMBER
FROM dbo.DimProduct AS DP INNER JOIN dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%' AND FS.SalesAmount>10000

SELECT * from vWGetRankOfProducts