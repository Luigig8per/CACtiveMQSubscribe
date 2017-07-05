USE [DonBest]
GO

/****** Object:  Table [dbo].[line]    Script Date: 6/29/2017 7:22:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[line](
	[rot] [int] NULL,
	[period_id] [int] NULL,
	[period] [nchar](4) NULL,
	[event_id] [int] NULL,
	[sportsbook] [smallint] NULL,
	[description] [varchar](max) NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[away_spread] [real] NULL,
	[away_price] [int] NULL,
	[home_spread] [real] NULL,
	[home_price] [int] NULL,
	[idFeedLine] [int] IDENTITY(1,1) NOT NULL,
	[draw_price] [int] NULL,
	[date] [datetime] NULL,
	[home_rot] [int] NULL,
	[total_total] [real] NULL,
	[over_price] [int] NULL,
	[under_price] [int] NULL,
	[total] [real] NULL,
	[timeReceived] [datetime] NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_line] PRIMARY KEY CLUSTERED 
(
	[idFeedLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


