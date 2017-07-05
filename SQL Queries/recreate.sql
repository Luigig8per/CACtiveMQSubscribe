USE [DonBest]
GO

/****** Object:  Table [dbo].[sport]    Script Date: 6/29/2017 7:56:43 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

drop table [event];
drop table groups;
drop table league;

drop table sport;

USE [DonBest]
GO

/****** Object:  Table [dbo].[sport]    Script Date: 6/29/2017 8:39:59 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[sport](
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [DonBest]
GO

/****** Object:  Table [dbo].[league]    Script Date: 6/29/2017 8:39:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[league](
	[sport_id] [int] NULL,
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [DonBest]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 6/29/2017 8:38:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[groups](
	[id] [int] NOT NULL,
	[league_id] [int] NULL,
	[name] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [DonBest]
GO

/****** Object:  Table [dbo].[event]    Script Date: 6/29/2017 8:39:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[event](
	[group_id] [int] NULL,
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[timeReceived] [varchar](max) NULL,
	[season] [varchar](max) NULL,
	[date] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

