USE [DonBest]
GO

/****** Object:  Table [dbo].[participant]    Script Date: 6/30/2017 3:42:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[participant](
	[rot] [int] NULL,
	[side] [varchar](50) NOT NULL,
	[event_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[name] [varchar](max) NULL,
	[rotation_number] [int] NULL,
	[id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

