CREATE PROCEDURE [Model].[spBuildFactsAndDimensions]
AS
BEGIN

---------------------------------------------------------------------------------------------------------------------------------------
-- Create Online Order Dimension:
---------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT table_name FROM INFORMATION_SCHEMA.tables where table_name = 'DimOnlineOrder')
	DROP TABLE [Model].[DimOnlineOrder]

CREATE TABLE [Model].[DimOnlineOrder]
	(
	OnlineOrderKey int IDENTITY(1,1) NOT NULL,
	OnlineOrderFlag tinyint NOT NULL,
	OnlineOrderDescription varchar(50) NOT NULL,
	CreateDate datetime NOT NULL DEFAULT getdate()
	)

-- Populate data with my own descriptions:
INSERT INTO [Model].[DimOnlineOrder] (OnlineOrderFlag, OnlineOrderDescription) VALUES (0, 'In-Person Order')
INSERT INTO [Model].[DimOnlineOrder] (OnlineOrderFlag, OnlineOrderDescription) VALUES (1, 'Online Order')

---------------------------------------------------------------------------------------------------------------------------------------
-- Create Order Status Dimension:
---------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT table_name FROM INFORMATION_SCHEMA.tables where table_name = 'DimOrderStatus')
	DROP TABLE [Model].[DimOrderStatus]

CREATE TABLE [Model].[DimOrderStatus]
	(
	OrderStatusKey int IDENTITY(1,1) NOT NULL,
	DimOrderStatusFlag tinyint NOT NULL,
	DimOrderStatusDescription varchar(50) NOT NULL,
	CreateDate datetime NOT NULL DEFAULT getdate()
	)

-- Populate data with my own descriptions:
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (1, 'Order In Progress')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (2, 'Not Shipped - BackOrdered Items')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (3, 'Not Shipped - Insufficient Funds')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (4, 'Shipped - In Progress')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (5, 'Shipped - Delivered')

---------------------------------------------------------------------------------------------------------------------------------------
-- Create Credit Card Dimension:
---------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT table_name FROM INFORMATION_SCHEMA.tables where table_name = 'DimCreditCard')
	DROP TABLE [Model].[DimCreditCard]

CREATE TABLE [Model].[DimCreditCard]
	(
	CreditCardKey int IDENTITY(1,1) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	CardType nvarchar(50) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear Smallint NOT NULL,
	CreateDate datetime NOT NULL DEFAULT getdate()
	)

-- Populate data with Sales CreditCard data:
INSERT INTO [Model].[DimCreditCard]
	(
	CardNumber,
	CardType,
	ExpMonth,
	ExpYear
	)
SELECT
	distinct CardNumber,
	CardType,
	ExpMonth,
	ExpYear
FROM [Sales].[CreditCard]

---------------------------------------------------------------------------------------------------------------------------------------
-- Create Sales Fact Table:
---------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT table_name FROM INFORMATION_SCHEMA.tables where table_name = 'FactSales')
	DROP TABLE [Model].[FactSales]

CREATE TABLE [Model].[FactSales]
	(
	OrderDate datetime NOT NULL,
	DueDate datetime NOT NULL,
	ShipDate datetime NOT NULL,
	Subtotal money NOT NULL,
	TaxAmt money NOT NULL,
	Freight money NOT NULL,
	TotalDue money NOT NULL,
	CreateDate datetime NOT NULL DEFAULT getdate()
	)

END
GO


