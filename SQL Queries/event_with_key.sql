USE [DonBest]
GO

/****** Object:  Table [dbo].[event]    Script Date: 7/4/2017 3:48:45 PM ******/
DROP TABLE [dbo].[event]
GO

/****** Object:  Table [dbo].[event]    Script Date: 7/4/2017 3:48:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[event](
	[group_id] [int] NULL,
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[timeReceived] [varchar](max) NULL,
	[season] [varchar](max) NULL,
	[date] [varchar](max) NULL,
	[location_id] [int] NULL,
	[location_link] [varchar](50) NULL,
	[location_name] [varchar](50) NULL,
	[event_type] [varchar](max) NULL,
	[event_state] [varchar](50) NULL,
	[time_changed] [varchar](50) NULL,
	[neutral] [varchar](50) NULL,
	[game_number] [int] NULL,
	[score_link] [varchar](50) NULL,
	[live] [bit] NULL,
	[pitcher_changed] [bit] NULL,
	[event_id] [nchar](10) NULL,
	[participant_away_rot] [int] NULL,
	[participant_away_side] [varchar](50) NULL,
	[participant_away_id] [int] NULL,
	[participant_away_name] [varchar](50) NULL,
	[participant_away_link] [varchar](50) NULL,
	[participant_home_rot] [int] NULL,
	[participant_home_side] [varchar](50) NULL,
	[participant_home_id] [int] NULL,
	[participant_home_name] [varchar](50) NULL,
	[participant_home_link] [varchar](50) NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[participant_away_pitcher_id] [int] NULL,
	[participant_away_pitcher_hand] [varchar](50) NULL,
	[participant_home_pitcher_full_name] [varchar](max) NULL,
	[participant_home_pitcher_id] [int] NULL,
	[participant_away_pitcher_full_name] [varchar](max) NULL,
	[participant_home_pitcher_hand] [varchar](50) NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

