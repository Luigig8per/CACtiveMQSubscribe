USE [DonBest]
GO

/****** Object:  Table [dbo].[time_changed]    Script Date: 7/4/2017 1:49:56 PM ******/
DROP TABLE [dbo].[time_changed]
GO

/****** Object:  Table [dbo].[time_changed]    Script Date: 7/4/2017 1:49:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[time_changed](
	[time_changed] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

