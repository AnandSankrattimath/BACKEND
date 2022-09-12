---Assignment 5.1
SELECT DP.ProductName,
MAX(FS.SalesAmount) AS MAX_SALES_AMOUNT,
MIN(FS.SalesAmount) AS MIN_SALES_AMOUNT,
AVG(FS.SalesAmount) AS AVG_SALES_AMOUNT,
SUM(FS.SalesAmount) AS SUM_SALES_AMOUNT,
COUNT(FS.SalesAmount) AS CNT_SALES_AMOUNT
FROM dbo.DimProduct AS DP
INNER JOIN
dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;

--Assignment 5.2
SELECT DP.ProductKey,DP.ProductName,FS.SalesAmount,
RANK() OVER( PARTITION BY DP.ProductName ORDER BY FS.salesamount DESC) AS RANK,
DENSE_RANK() OVER (PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS DENSE_RANK,
ROW_NUMBER() OVER (PARTITION BY DP.ProductName ORDER BY FS.salesAmount DESC) AS ROW_NUMBER
FROM dbo.DimProduct AS DP INNER JOIN dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%' AND FS.SalesAmount > 20000

--Assignment 5.3
SELECT dbo.DimProductCategory.ProductCategoryDescription,
CASE
WHEN dbo.DimProductCategory.ProductCategoryName LIKE '%Music, Movies and Audio Books%'
THEN 'Youtube'
END
FROM
dbo.DimProductCategory

