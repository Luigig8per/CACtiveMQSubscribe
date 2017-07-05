USE [DonBest]
GO

/****** Object:  Table [dbo].[event_state]    Script Date: 7/4/2017 1:29:35 PM ******/
DROP TABLE [dbo].[event_state]
GO

/****** Object:  Table [dbo].[event_state]    Script Date: 7/4/2017 1:29:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[event_state](
	[event_id] [int] NULL,
	[rot] [int] NULL,
	[event_state_type_id] [int] NULL,
	[event_state] [varchar](20) NULL,
	[time] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[id_even_state] [int] IDENTITY(1,1) NOT NULL,
	[eventid] [int] NULL,
	[event_type] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

