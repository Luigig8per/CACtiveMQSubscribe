USE [DonBest]
GO

/****** Object:  Table [dbo].[pitcher_changed]    Script Date: 7/4/2017 1:32:23 PM ******/
DROP TABLE [dbo].[pitcher_changed]
GO

/****** Object:  Table [dbo].[pitcher_changed]    Script Date: 7/4/2017 1:32:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[pitcher_changed](
	[pitcherChanged] [varchar](50) NULL,
	[participant_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL,
	[pitcher_changed] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

