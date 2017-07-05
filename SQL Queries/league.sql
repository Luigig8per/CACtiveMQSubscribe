USE [DonBest]
GO

/****** Object:  Table [dbo].[league]    Script Date: 6/29/2017 7:57:30 AM ******/
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
	[timeReceived] [datetime] NULL,
 CONSTRAINT [PK_league] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[league]  WITH CHECK ADD  CONSTRAINT [FK_league_sport] FOREIGN KEY([sport_id])
REFERENCES [dbo].[sport] ([id])
GO

ALTER TABLE [dbo].[league] CHECK CONSTRAINT [FK_league_sport]
GO

