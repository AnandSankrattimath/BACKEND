--------------------------------------------ASSIGNMENT 5.1------------------------------------------

SELECT * FROM DimProduct;

SELECT * from FactSales;

--INNER JOIN
SELECT DP.ProductName,DP.ProductKey,FS.ProductKey,FS.SalesAmount
FROM dbo.DimProduct AS DP
INNER JOIN 
dbo.FactSales AS FS ON DP.ProductKey = FS.ProductKey;


----AGGREGATE FUNCTIONS ON INNER JOIN----

--MAX()--
SELECT MAX(FS.SalesAmount) as MIN_SALES_AMOUNT,DP.ProductName
FROM dbo.DimProduct DP
INNER JOIN 
dbo.FactSales FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;


--MIN()--
SELECT MIN(FS.SalesAmount) as MIN_SALES_AMOUNT,DP.ProductName
FROM dbo.DimProduct DP
INNER JOIN 
dbo.FactSales FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;


--COUNT()--
SELECT COUNT(*) as COUNT_SALES_ROWS,DP.ProductName
FROM dbo.DimProduct DP
INNER JOIN 
dbo.FactSales FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;


--SUM()---
SELECT SUM(FS.SalesAmount) as SUM_SALES_AMOUNT,DP.ProductName
FROM dbo.DimProduct DP
INNER JOIN 
dbo.FactSales FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;


--AVG()---
SELECT AVG(FS.SalesAmount) as AVG_SALES_AMOUNT,DP.ProductName
FROM dbo.DimProduct DP
INNER JOIN 
dbo.FactSales FS ON DP.ProductKey = FS.ProductKey
WHERE DP.ProductName LIKE '%420%'
GROUP BY DP.ProductName
HAVING SUM(FS.SalesAmount) > 10000
ORDER BY DP.ProductName DESC;



------------ALL at ONCE--------------
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









