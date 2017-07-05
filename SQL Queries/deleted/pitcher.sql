USE [DonBest]
GO

/****** Object:  Table [dbo].[pitcher]    Script Date: 7/4/2017 1:27:21 PM ******/
DROP TABLE [dbo].[pitcher]
GO

/****** Object:  Table [dbo].[pitcher]    Script Date: 7/4/2017 1:27:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[pitcher](
	[participant_id] [int] NULL,
	[hand] [varchar](50) NULL,
	[id] [int] NULL,
	[full_name] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

