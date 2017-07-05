USE [DonBest]
GO

/****** Object:  Table [dbo].[league]    Script Date: 6/30/2017 9:27:46 AM ******/
DROP TABLE [dbo].[league]
GO

/****** Object:  Table [dbo].[league]    Script Date: 6/30/2017 9:27:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[league](
	[sport_id] [int] NULL,
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


