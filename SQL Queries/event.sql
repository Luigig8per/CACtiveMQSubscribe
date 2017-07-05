USE [DonBest]
GO

/****** Object:  Table [dbo].[event]    Script Date: 6/30/2017 12:12:40 PM ******/
DROP TABLE [dbo].[event]
GO

/****** Object:  Table [dbo].[event]    Script Date: 6/30/2017 12:12:40 PM ******/
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
	[timeReceived] [datetime] NULL,
	[season] [varchar](max) NULL,
	[date] [datetime] NULL,
	[event_type] [varchar](50) NULL,
	[event_state] [varchar](50) NULL,
	[time_changed] [varchar](50) NULL,
	[neutral] [varchar](50) NULL,
	[game_number] [int] NULL,
	[side] [varchar](50) NULL,
	[rot] [varchar](50) NULL,
	[event_id] [int] NULL,
	[live] [varchar](50) NULL,
	[pitcher_changed] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

