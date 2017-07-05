USE [DonBest]
GO

/****** Object:  Table [dbo].[event_type]    Script Date: 7/4/2017 1:54:35 PM ******/
DROP TABLE [dbo].[event_type]
GO

/****** Object:  Table [dbo].[event_type]    Script Date: 7/4/2017 1:54:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[event_type](
	[eventid] [int] NULL,
	[event_type] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

