USE [DonBest]
GO

/****** Object:  Table [dbo].[sport]    Script Date: 6/30/2017 9:28:17 AM ******/
DROP TABLE [dbo].[sport]
GO

/****** Object:  Table [dbo].[sport]    Script Date: 6/30/2017 9:28:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sport](
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


