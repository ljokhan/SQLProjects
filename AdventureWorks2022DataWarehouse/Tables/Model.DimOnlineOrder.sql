CREATE TABLE [Model].[DimOnlineOrder](
	[OnlineOrderKey] [int] IDENTITY(1,1) NOT NULL,
	[OnlineOrderFlag] [tinyint] NOT NULL,
	[OnlineOrderDescription] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [Model].[DimOnlineOrder] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO