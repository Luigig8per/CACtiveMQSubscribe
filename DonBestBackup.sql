USE [master]
GO
/****** Object:  Database [DonBest]    Script Date: 7/7/2017 12:32:23 PM ******/
CREATE DATABASE [DonBest] ON  PRIMARY 
( NAME = N'DonBest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DonBest.mdf' , SIZE = 27648KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DonBest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DonBest_log.ldf' , SIZE = 688384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [luisma]    Script Date: 7/7/2017 12:32:23 PM ******/
CREATE USER [luisma] FOR LOGIN [luisma] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [luisma]
GO
/****** Object:  Table [dbo].[event]    Script Date: 7/7/2017 12:32:23 PM ******/
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
	[timeReceived] [datetime] NOT NULL,
	[season] [varchar](20) NULL,
	[date] [varchar](max) NULL,
	[location_id] [smallint] NULL,
	[location_link] [varchar](20) NULL,
	[location_name] [varchar](50) NULL,
	[event_type] [varchar](max) NULL,
	[event_state] [varchar](20) NULL,
	[time_changed] [bit] NULL,
	[neutral] [bit] NULL,
	[game_number] [int] NULL,
	[score_link] [varchar](50) NULL,
	[live] [bit] NULL,
	[pitcher_changed] [bit] NULL,
	[participant_away_rot] [int] NULL,
	[participant_away_side] [varchar](50) NULL,
	[participant_away_id] [int] NULL,
	[participant_away_name] [varchar](50) NULL,
	[participant_away_link] [varchar](50) NULL,
	[participant_home_rot] [int] NULL,
	[participant_home_side] [varchar](50) NULL,
	[participant_home_id] [int] NULL,
	[participant_home_name] [varchar](50) NULL,
	[participant_home_link] [varchar](50) NULL,
	[league_id] [tinyint] NULL,
	[sport_id] [tinyint] NULL,
	[participant_away_pitcher_id] [int] NULL,
	[participant_away_pitcher_hand] [varchar](50) NULL,
	[participant_home_pitcher_full_name] [varchar](max) NULL,
	[participant_home_pitcher_id] [int] NULL,
	[participant_away_pitcher_full_name] [varchar](max) NULL,
	[participant_home_pitcher_hand] [varchar](50) NULL,
 CONSTRAINT [PK_event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[event_state]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[event_state](
	[event_id] [int] NOT NULL,
	[rot] [int] NULL,
	[event_state_type_id] [tinyint] NULL,
	[event_state] [varchar](20) NULL,
	[time] [datetime] NULL,
	[league_id] [tinyint] NULL,
	[sport_id] [tinyint] NULL,
	[timeReceived] [datetime] NULL,
	[id_even_state] [int] IDENTITY(1,1) NOT NULL,
	[eventid] [int] NULL,
	[event_type] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[groups]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  Table [dbo].[heart_beat]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  Table [dbo].[league]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[league](
	[sport_id] [int] NULL,
	[id] [tinyint] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[link] [varchar](20) NOT NULL,
	[timeReceived] [datetime] NULL,
 CONSTRAINT [PK_league] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[line]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[line](
	[rot] [int] NULL,
	[period_id] [tinyint] NOT NULL,
	[period] [nchar](4) NULL,
	[event_id] [int] NULL,
	[sportsbook] [smallint] NULL,
	[description] [varchar](20) NULL,
	[league_id] [tinyint] NOT NULL,
	[sport_id] [tinyint] NOT NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[away_spread] [real] NULL,
	[away_price] [int] NULL,
	[home_spread] [real] NULL,
	[home_price] [int] NULL,
	[idFeedLine] [bigint] IDENTITY(1,1) NOT NULL,
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
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[matchup_score]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[matchup_score](
	[event_id] [int] NOT NULL,
	[away_rot] [int] NULL,
	[away_score] [tinyint] NULL,
	[home_rot] [int] NULL,
	[home_score] [tinyint] NULL,
	[sequence] [int] NULL,
	[period] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[final] [bit] NULL,
	[time] [datetime] NULL,
	[message_timestamp] [datetime] NULL,
	[league_id] [tinyint] NOT NULL,
	[sport_id] [tinyint] NOT NULL,
	[timereceived] [datetime] NOT NULL,
	[id_matchup_score] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_matchup_score] PRIMARY KEY CLUSTERED 
(
	[id_matchup_score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[message_received]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[message_received](
	[id_message_received] [int] IDENTITY(1,1) NOT NULL,
	[message_received] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[participant]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[participant](
	[rot] [int] NULL,
	[side] [varchar](20) NOT NULL,
	[event_id] [int] NULL,
	[timeReceived] [datetime] NULL,
	[name] [varchar](max) NULL,
	[rotation_number] [int] NULL,
	[team_id] [int] NULL,
	[link] [varchar](50) NULL,
	[team_name] [varchar](50) NULL,
	[team_link] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pitching_change]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pitching_change](
	[id] [int] NOT NULL,
	[event_id] [int] NOT NULL,
	[time] [date] NOT NULL,
	[league_id] [tinyint] NOT NULL,
	[sport_id] [tinyint] NOT NULL,
	[pitcher_name] [varchar](50) NULL,
	[pitcher_hand] [char](3) NOT NULL,
	[player_id] [int] NOT NULL,
	[full_name] [varchar](max) NULL,
	[timeReceived] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schedule_change]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[schedule_change](
	[id] [int] NULL,
	[description] [varchar](50) NULL,
	[timestamp] [datetime] NULL,
	[timeReceived] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sport]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sport](
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
	[link] [varchar](20) NULL,
	[timeReceived] [datetime] NULL,
 CONSTRAINT [PK_sport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[take_down]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[take_down](
	[event_id] [int] NULL,
	[rot] [int] NULL,
	[sportsbook] [int] NULL,
	[period_id] [smallint] NULL,
	[time] [datetime] NULL,
	[league_id] [smallint] NOT NULL,
	[sport_id] [tinyint] NOT NULL,
	[away_team_id] [int] NULL,
	[home_team_id] [int] NULL,
	[timeReceived] [datetime] NOT NULL,
	[id_event_state] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[team_change]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[team_change](
	[event_id] [int] NOT NULL,
	[rotation_id] [int] NULL,
	[team_id] [int] NOT NULL,
	[team_name] [varchar](50) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[league_id] [tinyint] NOT NULL,
	[sport_id] [tinyint] NOT NULL,
	[timeReceived] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[time_change]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_change](
	[event_id] [int] NOT NULL,
	[rot] [int] NULL,
	[open_time] [datetime] NOT NULL,
	[time] [datetime] NOT NULL,
	[tba_flag] [bit] NULL,
	[league_id] [int] NOT NULL,
	[sport_id] [int] NOT NULL,
	[timeReceived] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[events_view]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[events_view]
AS
SELECT        dbo.event.*
FROM            dbo.event

GO
/****** Object:  View [dbo].[game_participants]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[game_participants]
AS
SELECT DISTINCT 
                         dbo.participant.event_id, dbo.event.group_id, dbo.groups.league_id, dbo.league.sport_id, dbo.participant.rot, dbo.participant.name, dbo.event.name AS eventname, dbo.event.season, 
                         dbo.groups.name AS groupname, dbo.league.name AS leaguename, dbo.sport.name AS sportname
FROM            dbo.participant INNER JOIN
                         dbo.event ON dbo.participant.event_id = dbo.event.id INNER JOIN
                         dbo.groups ON dbo.event.group_id = dbo.groups.id INNER JOIN
                         dbo.league ON dbo.groups.league_id = dbo.league.id INNER JOIN
                         dbo.sport ON dbo.league.sport_id = dbo.sport.id

GO
/****** Object:  View [dbo].[groups_view]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[groups_view]
AS
SELECT        id, league_id, name, timeReceived
FROM            dbo.groups

GO
/****** Object:  View [dbo].[leagues_view]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[leagues_view]
AS
SELECT        sport_id, id, name, link, timeReceived
FROM            dbo.league

GO
/****** Object:  View [dbo].[participants_view]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[participants_view]
AS
SELECT        rot, side, event_id, timeReceived, name, rotation_number
FROM            dbo.participant

GO
/****** Object:  View [dbo].[scheduleView]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[scheduleView]
AS
SELECT DISTINCT 
                         TOP (100) PERCENT dbo.event.id, dbo.event.date, dbo.event.name, dbo.event.season, dbo.groups.name AS groupname, dbo.league.name AS leaguename, dbo.sport.name AS sportname, dbo.league.link, 
                         dbo.event.timeReceived, dbo.event.event_type, dbo.event.event_state, dbo.event.time_changed, dbo.event.neutral, dbo.event.game_number
FROM            dbo.event INNER JOIN
                         dbo.groups ON dbo.event.group_id = dbo.groups.id INNER JOIN
                         dbo.league ON dbo.groups.league_id = dbo.league.id INNER JOIN
                         dbo.sport ON dbo.league.sport_id = dbo.sport.id
ORDER BY dbo.event.date, sportname, dbo.event.id

GO
/****** Object:  View [dbo].[view_all_line]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllLines]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NewInsertCommand]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NewSelectCommand]    Script Date: 7/7/2017 12:32:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SportInsert]    Script Date: 7/7/2017 12:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SportInsert]
  (@id int,
  @name varchar,
  @link varchar(20),
  @timeReceived datetime  )
AS
BEGIN 
   merge into sport as tgt
   using (values (@id, @name, @link, @timeReceived))
   as src(id, name, link, timeReceived)
   on src.id=tgt.id
   when matched then update 
   set tgt.name=src.name,
   tgt.link=src.link,
   tgt.timeReceived=src.timeReceived

   when not matched then insert
   values (src.id, src.name, src.link, src.timeReceived);
END;




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
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 215
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'events_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'events_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[12] 2[22] 3) )"
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
         Begin Table = "participant"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "event"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "groups"
            Begin Extent = 
               Top = 0
               Left = 433
               Bottom = 130
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "league"
            Begin Extent = 
               Top = 103
               Left = 683
               Bottom = 233
               Right = 853
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sport"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
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
      Begin ColumnWidths = 11
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
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'game_participants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lumn = 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'game_participants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'game_participants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[7] 3) )"
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
         Begin Table = "groups"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'groups_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'groups_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[14] 2[5] 3) )"
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
         Begin Table = "league"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'leagues_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'leagues_view'
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
         Begin Table = "participant"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'participants_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'participants_view'
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
         Top = -96
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
            TopColumn = 11
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
         Fi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'scheduleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lter = 1350
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
USE [master]
GO
ALTER DATABASE [DonBest] SET  READ_WRITE 
GO
