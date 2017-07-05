USE [DonBest]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 7/4/2017 10:32:35 AM ******/
DROP TABLE [dbo].[groups]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 7/4/2017 10:32:35 AM ******/
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

