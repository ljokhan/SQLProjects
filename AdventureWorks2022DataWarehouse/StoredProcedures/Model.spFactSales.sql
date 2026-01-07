CREATE PROCEDURE [Model].[spFactSales]
AS
BEGIN

-- Truncate Dimension:
TRUNCATE TABLE [Model].[FactSales]

-- Populate data with Sales CreditCard data:
INSERT INTO [Model].[FactSales]
	(
	OrderDate,
	DueDate,
	ShipDate,
	Subtotal,
	TaxAmt,
	Freight,
	TotalDue
	)
SELECT
	OrderDate,
	DueDate,
	ShipDate,
	Subtotal,
	TaxAmt,
	Freight,
	TotalDue
FROM [Sales].[SalesOrderHeader]

END
GO