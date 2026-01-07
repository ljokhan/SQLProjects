CREATE PROCEDURE [Model].[spDimOrderStatus]
AS
BEGIN

-- Truncate Dimension:
TRUNCATE TABLE [Model].[DimOrderStatus]

-- Populate data with my own descriptions:
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (1, 'Order In Progress')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (2, 'Not Shipped - BackOrdered Items')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (3, 'Not Shipped - Insufficient Funds')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (4, 'Shipped - In Progress')
INSERT INTO [Model].[DimOrderStatus] (DimOrderStatusFlag, DimOrderStatusDescription) VALUES (5, 'Shipped - Delivered')

END
GO