USE [ambertrade]
GO
ALTER TABLE [dbo].[holdings] DROP CONSTRAINT [FK_holdings_users]
GO
ALTER TABLE [dbo].[holdings] DROP CONSTRAINT [FK_holdings_Game]
GO
ALTER TABLE [dbo].[balance] DROP CONSTRAINT [FK_balance_users]
GO
ALTER TABLE [dbo].[balance] DROP CONSTRAINT [FK_balance_Game]
GO
ALTER TABLE [dbo].[accounts] DROP CONSTRAINT [FK_accounts_users]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/13/2022 9:41:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[holdings]    Script Date: 4/13/2022 9:41:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[holdings]') AND type in (N'U'))
DROP TABLE [dbo].[holdings]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 4/13/2022 9:41:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Game]') AND type in (N'U'))
DROP TABLE [dbo].[Game]
GO
/****** Object:  Table [dbo].[balance]    Script Date: 4/13/2022 9:41:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[balance]') AND type in (N'U'))
DROP TABLE [dbo].[balance]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/13/2022 9:41:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accounts]') AND type in (N'U'))
DROP TABLE [dbo].[accounts]
GO
USE [master]
GO
/****** Object:  Database [ambertrade]    Script Date: 4/13/2022 9:41:43 PM ******/
DROP DATABASE [ambertrade]
GO
/****** Object:  Database [ambertrade]    Script Date: 4/13/2022 9:41:43 PM ******/
CREATE DATABASE [ambertrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ambertrade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ambertrade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ambertrade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ambertrade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ambertrade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ambertrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ambertrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ambertrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ambertrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ambertrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ambertrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [ambertrade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ambertrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ambertrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ambertrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ambertrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ambertrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ambertrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ambertrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ambertrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ambertrade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ambertrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ambertrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ambertrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ambertrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ambertrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ambertrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ambertrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ambertrade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ambertrade] SET  MULTI_USER 
GO
ALTER DATABASE [ambertrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ambertrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ambertrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ambertrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ambertrade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ambertrade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ambertrade] SET QUERY_STORE = OFF
GO
USE [ambertrade]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 4/13/2022 9:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[user_id] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[balance]    Script Date: 4/13/2022 9:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[balance](
	[balance] [decimal](18, 2) NULL,
	[game_id] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 4/13/2022 9:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[game_id] [int] IDENTITY(100,1) NOT NULL,
	[game_name] [varchar](50) NOT NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[holdings]    Script Date: 4/13/2022 9:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holdings](
	[stock] [varchar](max) NOT NULL,
	[user_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[purchase_price] [decimal](18, 2) NULL,
	[sale_price] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/13/2022 9:41:43 PM ******/
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
SET IDENTITY_INSERT [dbo].[Game] ON 
GO
INSERT [dbo].[Game] ([game_id], [game_name], [startdate], [enddate]) VALUES (100, N'Demo', NULL, NULL)
GO
INSERT [dbo].[Game] ([game_id], [game_name], [startdate], [enddate]) VALUES (101, N'Demo', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
INSERT [dbo].[holdings] ([stock], [user_id], [game_id], [quantity], [purchase_price], [sale_price]) VALUES (N'AAPL', 1, 100, 2, CAST(100.00 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[holdings] ([stock], [user_id], [game_id], [quantity], [purchase_price], [sale_price]) VALUES (N'NVDA', 2, 100, 1, CAST(300.53 AS Decimal(18, 2)), NULL)
GO
INSERT [dbo].[holdings] ([stock], [user_id], [game_id], [quantity], [purchase_price], [sale_price]) VALUES (N'NVDA', 1, 100, 3, CAST(200.00 AS Decimal(18, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (1, N'user', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user')
GO
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (2, N'admin', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin')
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_users]
GO
ALTER TABLE [dbo].[balance]  WITH CHECK ADD  CONSTRAINT [FK_balance_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([game_id])
GO
ALTER TABLE [dbo].[balance] CHECK CONSTRAINT [FK_balance_Game]
GO
ALTER TABLE [dbo].[balance]  WITH CHECK ADD  CONSTRAINT [FK_balance_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[balance] CHECK CONSTRAINT [FK_balance_users]
GO
ALTER TABLE [dbo].[holdings]  WITH CHECK ADD  CONSTRAINT [FK_holdings_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([game_id])
GO
ALTER TABLE [dbo].[holdings] CHECK CONSTRAINT [FK_holdings_Game]
GO
ALTER TABLE [dbo].[holdings]  WITH CHECK ADD  CONSTRAINT [FK_holdings_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[holdings] CHECK CONSTRAINT [FK_holdings_users]
GO
USE [master]
GO
ALTER DATABASE [ambertrade] SET  READ_WRITE 
GO


SELECT * FROM users 
SELECT * FROM Game 
SELECT * FROM holdings 
SELECT * FROM balance 


insert Game (game_name, balance,user_id, game_id)
OUTPUT INSERTED.game_id
values ('', 100000, 3, 117);
