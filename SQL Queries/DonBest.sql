USE [master]
GO
/****** Object:  Database [DonBest]    Script Date: 6/29/2017 1:28:37 PM ******/
CREATE DATABASE [DonBest] ON  PRIMARY 
( NAME = N'DonBest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DonBest.mdf' , SIZE = 19456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DonBest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DonBest_log.ldf' , SIZE = 102144KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DonBest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DonBest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DonBest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DonBest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DonBest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DonBest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DonBest] SET ARITHABORT OFF 
GO
ALTER DATABASE [DonBest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DonBest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DonBest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DonBest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DonBest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DonBest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DonBest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DonBest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DonBest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DonBest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DonBest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DonBest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DonBest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DonBest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DonBest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DonBest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DonBest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DonBest] SET RECOVERY FULL 
GO
ALTER DATABASE [DonBest] SET  MULTI_USER 
GO
ALTER DATABASE [DonBest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DonBest] SET DB_CHAINING OFF 
GO
USE [DonBest]
GO
/****** Object:  User [luisma]    Script Date: 6/29/2017 1:28:37 PM ******/
CREATE USER [luisma] FOR LOGIN [luisma] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [luisma]
GO
/****** Object:  Table [dbo].[date]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[date](
	[date] [varchar](max) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event]    Script Date: 6/29/2017 1:28:37 PM ******/
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
	[timeReceived] [datetime] NULL,
	[season] [varchar](max) NULL,
	[date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event_state]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event_state](
	[event_id] [int] NULL,
	[rot] [int] NULL,
	[event_state_type_id] [int] NULL,
	[event_state] [varchar](20) NULL,
	[time] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[id_even_state] [int] IDENTITY(1,1) NOT NULL,
	[eventid] [int] NULL,
	[event_type] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event_type]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event_type](
	[eventid] [int] NULL,
	[event_type] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[game_number]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[game_number](
	[game_number] [varchar](max) NULL,
	[event_id] [int] NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[groups]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[heart_beat]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[id]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[league]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[line]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[line](
	[rot] [int] NULL,
	[period_id] [int] NULL,
	[period] [nchar](4) NULL,
	[event_id] [int] NULL,
	[sportsbook] [smallint] NULL,
	[description] [varchar](max) NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[away_spread] [real] NULL,
	[away_price] [int] NULL,
	[home_spread] [real] NULL,
	[home_price] [int] NULL,
	[idFeedLine] [int] IDENTITY(1,1) NOT NULL,
	[draw_price] [int] NULL,
	[date] [datetime] NULL,
	[home_rot] [int] NULL,
	[total_total] [real] NULL,
	[over_price] [int] NULL,
	[under_price] [int] NULL,
	[total] [real] NULL,
	[timeReceived] [datetime] NULL,
	[timestamp] [datetime] NULL,
 CONSTRAINT [PK_line] PRIMARY KEY CLUSTERED 
(
	[idFeedLine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[link]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[link](
	[link] [varchar](max) NULL,
	[idLink] [int] IDENTITY(1,1) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[live]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[location]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
	[name] [varchar](max) NULL,
	[id] [int] NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[matchup_score]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[matchup_score](
	[event_id] [int] NULL,
	[away_rot] [int] NULL,
	[away_score] [int] NULL,
	[home_rot] [int] NULL,
	[home_score] [int] NULL,
	[sequence] [int] NULL,
	[period] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[final] [varchar](max) NULL,
	[time] [datetime] NULL,
	[message_timestamp] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
	[timereceived] [datetime] NULL,
	[id_matchup_score] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[matchup_score event_id]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matchup_score event_id](
	[id_feed_matchup_score] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[away_rot] [int] NULL,
	[away_score] [int] NULL,
	[home_rot] [int] NULL,
	[home_score] [int] NULL,
	[sequence] [int] NULL,
	[period] [nchar](10) NULL,
	[description] [nvarchar](50) NULL,
	[final] [bit] NULL,
	[time] [datetime] NULL,
	[message_timestamp] [datetime] NULL,
	[league_id] [int] NULL,
	[sport_id] [int] NULL,
 CONSTRAINT [PK_matchup_score event_id] PRIMARY KEY CLUSTERED 
(
	[id_feed_matchup_score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[neutral]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[neutral](
	[neutral] [varchar](max) NULL,
	[idevent] [int] NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[participant]    Script Date: 6/29/2017 1:28:37 PM ******/
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
	[rotation_number] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pitcher]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[pitcher_changed]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pitcher_changed](
	[pitcherChanged] [varchar](50) NULL,
	[participant_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL,
	[pitcher_changed] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pitcherChanged]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pitcherChanged](
	[pitcherChanged] [varchar](50) NULL,
	[participant_id] [int] NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[queries]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[queries](
	[idQuery] [int] IDENTITY(1,1) NOT NULL,
	[query] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sch_sport]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sch_sport](
	[sch_] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[schedule]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[schedule](
	[schedule] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[score]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[score](
	[event_id] [int] NULL,
	[link] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sport]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[take_down]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[take_down](
	[event_id] [int] NULL,
	[rot] [int] NULL,
	[sportsbook] [tinyint] NULL,
	[period_id] [smallint] NULL,
	[time] [datetime] NULL,
	[league_id] [smallint] NULL,
	[sport_id] [smallint] NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[id_event_state] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[team]    Script Date: 6/29/2017 1:28:37 PM ******/
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
/****** Object:  Table [dbo].[time_changed]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[time_changed](
	[time_changed] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[event_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[title]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[title](
	[title] [varchar](max) NULL,
	[timeReceived] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[updated]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[updated](
	[updated] [varchar](max) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[scheduleView]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[scheduleView]
AS
SELECT DISTINCT 
                         TOP (100) PERCENT dbo.event.id, dbo.event.date, dbo.event.name, dbo.event.season, dbo.groups.name AS groupname, dbo.league.name AS leaguename, dbo.sport.name AS sportname, dbo.league.link, 
                         dbo.event.timeReceived
FROM            dbo.event INNER JOIN
                         dbo.groups ON dbo.event.group_id = dbo.groups.id INNER JOIN
                         dbo.league ON dbo.groups.league_id = dbo.league.id INNER JOIN
                         dbo.sport ON dbo.league.sport_id = dbo.sport.id
ORDER BY dbo.event.date, sportname, dbo.event.id

GO
/****** Object:  View [dbo].[scheduleViewwithparticipants]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[scheduleViewwithparticipants]
AS
SELECT DISTINCT 
                         TOP (100) PERCENT dbo.event.id, dbo.event.date, dbo.event.name, dbo.event.season, dbo.groups.name AS groupname, dbo.league.name AS leaguename, dbo.sport.name AS sportname, dbo.league.link, 
                         dbo.event.timeReceived, dbo.participant.rot, dbo.participant.name AS participantname
FROM            dbo.event INNER JOIN
                         dbo.groups ON dbo.event.group_id = dbo.groups.id INNER JOIN
                         dbo.league ON dbo.groups.league_id = dbo.league.id INNER JOIN
                         dbo.sport ON dbo.league.sport_id = dbo.sport.id INNER JOIN
                         dbo.participant ON dbo.event.id = dbo.participant.event_id
ORDER BY dbo.event.date, sportname, dbo.event.id

GO
/****** Object:  View [dbo].[view_all_line]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_all_line]
AS
SELECT        rot, timestamp, period_id, period, event_id, sportsbook, description, league_id, sport_id, away_team_id, home_team_id, away_spread, away_price, home_spread, home_price, idFeedLine, draw_price, date, 
                         home_rot, total_total, over_price, under_price
FROM            dbo.line

GO
/****** Object:  View [dbo].[view3]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view3]
AS
SELECT        TOP (100) PERCENT dbo.participant.name AS Expr1, dbo.participant.rotation_number, dbo.event.date, dbo.event.name, dbo.event.season, dbo.groups.name AS groupname, dbo.league.name AS leaguename, 
                         dbo.sport.name AS sportname, dbo.league.link, dbo.event.id, dbo.participant.event_id, dbo.team.name AS Expr2, dbo.team.id AS Expr3
FROM            dbo.event INNER JOIN
                         dbo.groups ON dbo.event.group_id = dbo.groups.id INNER JOIN
                         dbo.league ON dbo.groups.league_id = dbo.league.id INNER JOIN
                         dbo.sport ON dbo.league.sport_id = dbo.sport.id INNER JOIN
                         dbo.participant ON dbo.event.id = dbo.participant.event_id INNER JOIN
                         dbo.team ON dbo.participant.rot = dbo.team.participant_id
ORDER BY dbo.event.date, sportname, dbo.event.id

GO
/****** Object:  StoredProcedure [dbo].[getAllLines]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllLines]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        rot, timestamp, period_id, period, event_id, sportsbook, description, league_id, sport_id, away_team_id, home_team_id, away_spread, away_price, home_spread, home_price, idFeedLine, draw_price, date, 
                         home_rot, total_total, over_price, under_price
FROM            dbo.line
END

GO
/****** Object:  StoredProcedure [dbo].[NewInsertCommand]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewInsertCommand]
(
	@rot int,
	@timestamp datetime,
	@period_id int,
	@period nchar(4),
	@event_id int,
	@sportsbook smallint,
	@description varchar(MAX),
	@league_id int,
	@sport_id int,
	@away_team_id int,
	@home_team_id int,
	@away_spread real,
	@away_price int,
	@home_spread real,
	@home_price int,
	@draw_price int,
	@date datetime,
	@home_rot int,
	@total_total real,
	@over_price int,
	@under_price int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [line] ([rot], [timestamp], [period_id], [period], [event_id], [sportsbook], [description], [league_id], [sport_id], [away_team_id], [home_team_id], [away_spread], [away_price], [home_spread], [home_price], [draw_price], [date], [home_rot], [total_total], [over_price], [under_price]) VALUES (@rot, @timestamp, @period_id, @period, @event_id, @sportsbook, @description, @league_id, @sport_id, @away_team_id, @home_team_id, @away_spread, @away_price, @home_spread, @home_price, @draw_price, @date, @home_rot, @total_total, @over_price, @under_price)

GO
/****** Object:  StoredProcedure [dbo].[NewSelectCommand]    Script Date: 6/29/2017 1:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NewSelectCommand]
AS
	SET NOCOUNT ON;
SELECT        *
FROM            line

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[12] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "groups"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 173
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "league"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "sport"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1335
         Width = 2220
         Width = 1500
         Width = 1500
         Width = 2265
         Width = 2160
         Width = 930
         Width = 1500
         Width = 1230
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'r = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[5] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "groups"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "league"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sport"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "participant"
            Begin Extent = 
               Top = 105
               Left = 325
               Bottom = 235
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Ali' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleViewwithparticipants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'as = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleViewwithparticipants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleViewwithparticipants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "line"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_all_line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_all_line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[19] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "groups"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "league"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sport"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "participant"
            Begin Extent = 
               Top = 223
               Left = 183
               Bottom = 353
               Right = 361
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "team"
            Begin Extent = 
               Top = 207
               Left = 498
               Bottom = 337
               Right = 668
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1860
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 2355
         Width = 3120
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2115
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view3'
GO
USE [master]
GO
ALTER DATABASE [DonBest] SET  READ_WRITE 
GO
