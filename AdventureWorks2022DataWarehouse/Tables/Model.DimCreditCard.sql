CREATE TABLE [Model].[DimCreditCard](
	[CreditCardKey] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](25) NOT NULL,
	[CardType] [nvarchar](50) NOT NULL,
	[ExpMonth] [tinyint] NOT NULL,
	[ExpYear] [smallint] NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [Model].[DimCreditCard] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO