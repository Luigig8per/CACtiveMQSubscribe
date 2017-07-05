USE [DonBest]
GO

/****** Object:  Table [dbo].[team]    Script Date: 7/4/2017 1:28:33 PM ******/
DROP TABLE [dbo].[team]
GO

/****** Object:  Table [dbo].[team]    Script Date: 7/4/2017 1:28:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[team](
	[name] [varchar](max) NULL,
	[id] [int] NULL,
	[link] [varchar](max) NULL,
	[participant_id] [int] NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

