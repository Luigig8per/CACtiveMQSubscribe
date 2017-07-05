USE [DonBest]
GO

/****** Object:  Table [dbo].[title]    Script Date: 7/4/2017 1:49:00 PM ******/
DROP TABLE [dbo].[title]
GO

/****** Object:  Table [dbo].[title]    Script Date: 7/4/2017 1:49:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[title](
	[title] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

