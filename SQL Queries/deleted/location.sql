USE [DonBest]
GO

/****** Object:  Table [dbo].[location]    Script Date: 7/4/2017 1:31:35 PM ******/
DROP TABLE [dbo].[location]
GO

/****** Object:  Table [dbo].[location]    Script Date: 7/4/2017 1:31:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[location](
	[name] [varchar](max) NULL,
	[id] [int] NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

