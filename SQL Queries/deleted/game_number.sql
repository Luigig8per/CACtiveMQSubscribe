USE [DonBest]
GO

/****** Object:  Table [dbo].[game_number]    Script Date: 7/4/2017 1:29:59 PM ******/
DROP TABLE [dbo].[game_number]
GO

/****** Object:  Table [dbo].[game_number]    Script Date: 7/4/2017 1:29:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[game_number](
	[game_number] [varchar](max) NULL,
	[event_id] [int] NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

