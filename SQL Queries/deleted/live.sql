USE [DonBest]
GO

/****** Object:  Table [dbo].[live]    Script Date: 7/4/2017 1:31:14 PM ******/
DROP TABLE [dbo].[live]
GO

/****** Object:  Table [dbo].[live]    Script Date: 7/4/2017 1:31:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[live](
	[live] [varchar](50) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

