CREATE PROCEDURE [Model].[spDimCreditCard]
AS
BEGIN

-- Truncate Dimension:
TRUNCATE TABLE [Model].[DimCreditCard]

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

END
GO