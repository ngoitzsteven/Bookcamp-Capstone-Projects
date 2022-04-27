USE [ambertrade]
GO
ALTER TABLE [dbo].[holdings] DROP CONSTRAINT [FK_holdings_Game]
GO
ALTER TABLE [dbo].[holdings] DROP CONSTRAINT [FK_holdings_accounts]
GO
ALTER TABLE [dbo].[Game] DROP CONSTRAINT [FK_Game_accounts]
GO
ALTER TABLE [dbo].[accounts] DROP CONSTRAINT [FK_accounts_users]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/11/2022 2:13:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[holdings]    Script Date: 4/11/2022 2:13:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[holdings]') AND type in (N'U'))
DROP TABLE [dbo].[holdings]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 4/11/2022 2:13:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/11/2022 2:13:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accounts]') AND type in (N'U'))
DROP TABLE [dbo].[accounts]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/11/2022 2:13:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[accounts_id] [int] IDENTITY(1,100) NOT NULL,
	[game_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_accounts] PRIMARY KEY CLUSTERED 
(
	[accounts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 4/11/2022 2:13:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[game_id] [int] IDENTITY(100,1) NOT NULL,
	[game_name] [varchar](50) NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[holdings]    Script Date: 4/11/2022 2:13:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holdings](
	[stock] [varchar](max) NOT NULL,
	[balance] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[game_id] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/11/2022 2:13:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password_hash] [varchar](200) NOT NULL,
	[salt] [varchar](200) NOT NULL,
	[user_role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_users]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([accounts_id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_accounts]
GO
ALTER TABLE [dbo].[holdings]  WITH CHECK ADD  CONSTRAINT [FK_holdings_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([accounts_id])
GO
ALTER TABLE [dbo].[holdings] CHECK CONSTRAINT [FK_holdings_accounts]
GO
ALTER TABLE [dbo].[holdings]  WITH CHECK ADD  CONSTRAINT [FK_holdings_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([game_id])
GO
ALTER TABLE [dbo].[holdings] CHECK CONSTRAINT [FK_holdings_Game]
GO
