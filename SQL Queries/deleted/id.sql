USE [DonBest]
GO

/****** Object:  Table [dbo].[id]    Script Date: 7/4/2017 1:30:32 PM ******/
DROP TABLE [dbo].[id]
GO

/****** Object:  Table [dbo].[id]    Script Date: 7/4/2017 1:30:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[id](
	[id] [varchar](max) NULL,
	[idId] [int] IDENTITY(1,1) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

