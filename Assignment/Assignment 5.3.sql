

SELECT ProductCategoryName,
CASE
    WHEN ProductCategoryName = 'Music, Movies and Audio Books' THEN 'YouTube'
    ELSE 'Pending'
END AS ProductCategoryUpdatedName
FROM DimProductCategory;