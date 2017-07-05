USE [DonBest]
GO

/****** Object:  Table [dbo].[schedule]    Script Date: 7/4/2017 1:50:35 PM ******/
DROP TABLE [dbo].[schedule]
GO

/****** Object:  Table [dbo].[schedule]    Script Date: 7/4/2017 1:50:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[schedule](
	[schedule] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

