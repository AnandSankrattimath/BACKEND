

SELECT * from DimProduct

SELECT * from FactSales

------------------RANK() by SalesAmount--------------------------
SELECT DimProduct.ProductKey, DimProduct.ProductName,FactSales.SalesAmount,RANK() OVER(ORDER BY Factsales.salesamount DESC) AS RANK
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey=FactSales.ProductKey

SELECT DimProduct.ProductKey, DimProduct.ProductName,FactSales.SalesAmount,RANK() OVER(PARTITION BY DimProduct.ProductName  ORDER BY Factsales.salesamount DESC) AS RANK
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey=FactSales.ProductKey
WHERE DimProduct.ProductName LIKE '%420%' AND FactSales.SalesAmount>10000 

-------------DENSE_RANK() by SalesAmount----------------------------
SELECT DimProduct.ProductKey,DimProduct.ProductName,FactSales.SalesAmount, DENSE_RANK() OVER ( PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS DENSE_RANK
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey

----------------ROW_NUMBER() by salesAmount---------------------
SELECT DimProduct.ProductKey,DimProduct.ProductName,FactSales.SalesAmount, ROW_NUMBER() OVER (PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS ROW_NUMBER
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey


--------------ALL at ONCE------------------------------
SELECT DimProduct.ProductKey,DimProduct.ProductName,FactSales.SalesAmount,
RANK() OVER( PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesamount DESC) AS RANK,
DENSE_RANK() OVER ( PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS DENSE_RANK,
ROW_NUMBER() OVER (PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS ROW_NUMBER
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey
WHERE DimProduct.ProductName LIKE '%420%' AND FactSales.SalesAmount>10000



SELECT DimProduct.ProductKey,DimProduct.ProductName,FactSales.SalesAmount,
RANK() OVER( PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesamount DESC) AS RANK,
DENSE_RANK() OVER (PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS DENSE_RANK,
ROW_NUMBER() OVER (PARTITION BY DimProduct.ProductName ORDER BY Factsales.salesAmount DESC) AS ROW_NUMBER
FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey
WHERE DimProduct.ProductName='Contoso Home Theater System 4.1 Channel M1420 Black' AND FactSales.SalesAmount>10000



