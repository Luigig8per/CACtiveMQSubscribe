USE [DonBest]
GO

/****** Object:  Table [dbo].[matchup_score event_id]    Script Date: 6/29/2017 7:25:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[matchup_score event_id](
	[id_feed_matchup_score] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[away_rot] [int] NULL,
	[away_score] [int] NULL,
	[home_rot] [int] NULL,
	[home_score] [int] NULL,
	[sequence] [int] NULL,
	[period] [nchar](10) NULL,
	[description] [nvarchar](50) NULL,
	[final] [bit] NULL,
	[time] [datetime] NULL,
	[message_timestamp] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
 CONSTRAINT [PK_matchup_score event_id] PRIMARY KEY CLUSTERED 
(
	[id_feed_matchup_score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


