--Assignment 5.1

SELECT DP.ProductName,
MAX(FS.SalesAmount) AS MAX_SALES_AMOUNT,
MIN(FS.SalesAmount) AS MIN_SALES_AMOUNT,
COUNT(FS.SalesAmount) AS COUNT_SALES_AMOUNT,
SUM(FS.SalesAmount) AS SUM_SALES_AMOUNT,
AVG(FS.SalesAmount) AS AVG_SALES_AMOUNT
FROM dbo.DimProduct AS DP 
INNER JOIN 
dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%' 
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;