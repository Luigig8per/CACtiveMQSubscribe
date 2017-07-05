USE [DonBest]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 6/29/2017 7:58:07 AM ******/
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
	[timeReceived] [datetime] NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_league] FOREIGN KEY([league_id])
REFERENCES [dbo].[league] ([id])
GO

ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_league]
GO

