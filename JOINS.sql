USE ContosoRetailDW;

SELECT * FROM DimGeography;

SELECT * FROM DimStore;

--InnerJoin OR JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM DimGeography as GeoTB 
 JOIN DimStore as StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--LEFT JOIN OR LEFT OUTER JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM DimGeography as GeoTB 
LEFT JOIN DimStore as StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--RIGHT JOIN OR RIGHT OUTER JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM DimGeography as GeoTB 
RIGHT OUTER JOIN DimStore as StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;

--FULL OUTER JOIN OR FULL JOIN
SELECT GeoTB.CityName,GeoTB.ContinentName,GeoTB.GeographyKey,StoreTB.GeographyKey as GeoKeyInStore,StoreTB.StoreName 
FROM DimGeography as GeoTB 
FULL JOIN DimStore as StoreTB
ON GeoTB.GeographyKey=StoreTB.GeographyKey;


