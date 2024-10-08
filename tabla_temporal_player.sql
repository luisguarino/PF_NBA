USE [Sportics_LAM]
GO

/****** Object:  Table [dbo].[player_stats_temp]    Script Date: 8/10/2024 00:40:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[player_stats_temp](
	[Rk] [int] NOT NULL,
	[Player] [nvarchar](50) NOT NULL,
	[Pos] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Tm] [nvarchar](50) NOT NULL,
	[G] [int] NOT NULL,
	[GS] [int] NOT NULL,
	[MP] [float] NOT NULL,
	[FG] [float] NOT NULL,
	[FGA] [float] NOT NULL,
	[FG1] [float] NOT NULL,
	[_3P] [float] NOT NULL,
	[_3PA] [float] NOT NULL,
	[_3P1] [smallint] NOT NULL,
	[_2P] [float] NOT NULL,
	[_2PA] [float] NOT NULL,
	[_2P1] [float] NOT NULL,
	[eFG] [float] NOT NULL,
	[FT] [float] NOT NULL,
	[FTA] [float] NOT NULL,
	[FT1] [float] NOT NULL,
	[ORB] [float] NOT NULL,
	[DRB] [float] NOT NULL,
	[TRB] [float] NOT NULL,
	[AST] [float] NOT NULL,
	[STL] [float] NOT NULL,
	[BLK] [float] NOT NULL,
	[TOV] [float] NOT NULL,
	[PF] [float] NOT NULL,
	[PTS] [float] NOT NULL,
	[Season] [int] NOT NULL,
	[Season_type] [nvarchar](50) NOT NULL,
	[player_id] [int] NULL
) ON [PRIMARY]
GO


