/*
Missing Index Details from SQLQuery3.sql - ANAND.ContosoRetailDW (SQLAdmin (57))
The Query Processor estimates that implementing the following index could improve the query cost by 99.7986%.
*/


USE [ContosoRetailDW]
GO
CREATE NONCLUSTERED INDEX [ixNCDate]
ON [dbo].[CopyOfFactSales] ([DateKey])

GO

CREATE CLUSTERED INDEX ix_Date
ON CopyOfFactSales ( DateKey)
ON [partitionByYearScheme]([DateKey]);