USE [DonBest]
GO

/****** Object:  Table [dbo].[score]    Script Date: 7/4/2017 1:33:35 PM ******/
DROP TABLE [dbo].[score]
GO

/****** Object:  Table [dbo].[score]    Script Date: 7/4/2017 1:33:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[score](
	[event_id] [int] NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

