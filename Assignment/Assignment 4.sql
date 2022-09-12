--Assignment 4 -----
USE ContosoRetailDW;

SELECT * FROM dbo.DimGeography;

SELECT * FROM dbo.DimStore;

--Assignment 4.1
	--Completed..


--Assignment 4.2
--InnerJoin OR JOIN



--LEFT JOIN OR LEFT OUTER JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM dbo.DimGeography AS GeoTB 
LEFT JOIN dbo.DimStore AS StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--RIGHT JOIN OR RIGHT OUTER JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM dbo.DimGeography AS GeoTB 
RIGHT OUTER JOIN dbo.DimStore AS StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--FULL OUTER JOIN OR FULL JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM dbo.DimGeography AS GeoTB 
FULL OUTER JOIN dbo.DimStore AS StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--Assignment 4.3
--Left outer join equivalent to Inner join
SELECT * FROM dbo.DimGeography;
SELECT * FROM dbo.DimStore;

SELECT Geo.GeographyKey,Geo.ContinentName,Store.StoreName
FROM dbo.DimGeography AS Geo LEFT JOIN dbo.DimStore AS Store ON Geo.GeographyKey = Store.GeographyKey 
WHERE Store.StoreName IS NOT NUll  AND Store.StoreName   ='Contoso Bellevue Store';








