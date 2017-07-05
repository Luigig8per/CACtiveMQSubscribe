USE [DonBest]
GO

/****** Object:  Table [dbo].[event]    Script Date: 6/29/2017 10:25:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[event](
	[group_id] [int] NULL,
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[timeReceived] [varchar](max) NULL,
	[season] [varchar](max) NULL,
	[date] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

