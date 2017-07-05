USE [DonBest]
GO

/****** Object:  Table [dbo].[matchup_score]    Script Date: 6/29/2017 7:23:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[matchup_score](
	[event_id] [int] NULL,
	[away_rot] [int] NULL,
	[away_score] [int] NULL,
	[home_rot] [int] NULL,
	[home_score] [int] NULL,
	[sequence] [int] NULL,
	[period] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[final] [varchar](max) NULL,
	[time] [datetime] NULL,
	[message_timestamp] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[timereceived] [datetime] NULL,
	[id_matchup_score] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


