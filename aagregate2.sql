select * from dimproduct;

SELECT * from FactSales;

--INNER JOIN
SELECT DimProduct.ProductName,DimProduct.ProductKey,FactSales.ProductKey,FactSales.SalesAmount
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey;

--AGGREGATE FUNCTIONS ON INNER JOIN

--MAX()
SELECT MAX(FactSales.SalesAmount) as MAX_SALES_AMOUNT,DimProduct.ProductName
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey GROUP BY DimProduct.ProductName;

--MIN()
SELECT MIN(FactSales.SalesAmount) as MIN_SALES_AMOUNT
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey;

--COUNT()
SELECT DISTINCT(COUNT(FactSales.SalesAmount)) as COUNT_SALES_ROWS
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey;

--SUM()
SELECT SUM(FactSales.SalesAmount) as SALES_AMOUNT_SUM
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey;

--AVG()
SELECT MAX(FactSales.SalesAmount) AS SALES_AMOUNT_AVG,
DimProduct.ProductName
FROM DimProduct 
INNER JOIN 
FactSales ON DimProduct.ProductKey = FactSales.ProductKey 
WHERE FactSales.SalesAmount>35000
GROUP BY DimProduct.ProductName 
HAVING DimProduct.ProductName LIKE '%420%';

SELECT DimProduct.ProductName,FactSales.SalesAmount 
FROM DimProduct
INNER JOIN FactSales
ON DimProduct.ProductKey=FactSales.ProductKey 
GROUP BY DimProduct.ProductName like '%420%;
;



