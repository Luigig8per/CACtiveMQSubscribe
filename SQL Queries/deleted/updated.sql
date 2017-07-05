USE [DonBest]
GO

/****** Object:  Table [dbo].[updated]    Script Date: 7/4/2017 1:34:12 PM ******/
DROP TABLE [dbo].[updated]
GO

/****** Object:  Table [dbo].[updated]    Script Date: 7/4/2017 1:34:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[updated](
	[updated] [varchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

