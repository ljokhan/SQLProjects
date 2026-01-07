CREATE PROCEDURE [Model].[spDimOnlineOrder]
AS
BEGIN

-- Truncate Dimension:
TRUNCATE TABLE [Model].[DimOnlineOrder]

-- Populate data with my own descriptions:
INSERT INTO [Model].[DimOnlineOrder] (OnlineOrderFlag, OnlineOrderDescription) VALUES (0, 'In-Person Order')
INSERT INTO [Model].[DimOnlineOrder] (OnlineOrderFlag, OnlineOrderDescription) VALUES (1, 'Online Order')

END
GO