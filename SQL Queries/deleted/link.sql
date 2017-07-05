USE [DonBest]
GO

/****** Object:  Table [dbo].[link]    Script Date: 7/4/2017 1:51:49 PM ******/
DROP TABLE [dbo].[link]
GO

/****** Object:  Table [dbo].[link]    Script Date: 7/4/2017 1:51:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[link](
	[link] [varchar](max) NULL,
	[idLink] [int] IDENTITY(1,1) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

