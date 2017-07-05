USE [DonBest]
GO

/****** Object:  Table [dbo].[heart_beat]    Script Date: 7/5/2017 3:22:03 PM ******/
DROP TABLE [dbo].[heart_beat]
GO

/****** Object:  Table [dbo].[heart_beat]    Script Date: 7/5/2017 3:22:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[heart_beat](
	[id_heart_beat] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NULL,
	[timereceived] [datetime] NULL
) ON [PRIMARY]

GO

