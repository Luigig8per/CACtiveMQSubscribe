USE [DonBest]
GO

/****** Object:  Table [dbo].[date]    Script Date: 7/4/2017 1:29:02 PM ******/
DROP TABLE [dbo].[date]
GO

/****** Object:  Table [dbo].[date]    Script Date: 7/4/2017 1:29:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[date](
	[date] [varchar](max) NULL,
	[timeReceived] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

