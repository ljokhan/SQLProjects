CREATE TABLE [Model].[DimOrderStatus](
	[OrderStatusKey] [int] IDENTITY(1,1) NOT NULL,
	[DimOrderStatusFlag] [tinyint] NOT NULL,
	[DimOrderStatusDescription] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [Model].[DimOrderStatus] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
