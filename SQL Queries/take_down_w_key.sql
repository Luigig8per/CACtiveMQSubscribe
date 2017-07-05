USE [DonBest]
GO

/****** Object:  Table [dbo].[take_down]    Script Date: 7/5/2017 9:09:53 AM ******/
DROP TABLE [dbo].[take_down]
GO

/****** Object:  Table [dbo].[take_down]    Script Date: 7/5/2017 9:09:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[take_down](
	[event_id] [int] NULL,
	[rot] [int] NULL,
	[sportsbook] [int] NULL,
	[period_id] [smallint] NULL,
	[time] [datetime] NULL,
	[league_id] [smallint] NULL,
	[sport_id] [int] NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[id_event_state] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO

