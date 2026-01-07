CREATE TABLE [Model].[FactSales](
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[Subtotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [Model].[FactSales] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO