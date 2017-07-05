USE [DonBest]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 6/29/2017 8:38:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[groups](
	[id] [int] NOT NULL,
	[league_id] [int] NULL,
	[name] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

