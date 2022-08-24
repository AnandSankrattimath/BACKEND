
SELECT * FROM DimProduct; --WHERE ProductName like '%420%'
SELECT * FROM FactSales where SalesAmount>=408016;

SELECT MAX(FactSales.SalesAmount)as MAX_SALES_AMOUNT FROM DimProduct INNER JOIN FactSales ON DimProduct.ProductKey = FactSales.ProductKey ;