CREATE PROCEDURE [Model].[LoadFactsAndDimensions]
AS
BEGIN

EXECUTE [Model].[spDimCreditCard]
EXECUTE [Model].[spDimOnlineOrder]
EXECUTE [Model].[spDimOrderStatus]
EXECUTE [Model].[spFactSales]

END
GO