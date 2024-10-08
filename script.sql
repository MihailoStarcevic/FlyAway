USE [master]
GO
/****** Object:  Database [flyaway]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE DATABASE [flyaway]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'flyaway', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL2022\MSSQL\DATA\flyaway.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'flyaway_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL2022\MSSQL\DATA\flyaway_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [flyaway] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [flyaway].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [flyaway] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [flyaway] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [flyaway] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [flyaway] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [flyaway] SET ARITHABORT OFF 
GO
ALTER DATABASE [flyaway] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [flyaway] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [flyaway] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [flyaway] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [flyaway] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [flyaway] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [flyaway] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [flyaway] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [flyaway] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [flyaway] SET  DISABLE_BROKER 
GO
ALTER DATABASE [flyaway] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [flyaway] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [flyaway] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [flyaway] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [flyaway] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [flyaway] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [flyaway] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [flyaway] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [flyaway] SET  MULTI_USER 
GO
ALTER DATABASE [flyaway] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [flyaway] SET DB_CHAINING OFF 
GO
ALTER DATABASE [flyaway] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [flyaway] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [flyaway] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [flyaway] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [flyaway] SET QUERY_STORE = ON
GO
ALTER DATABASE [flyaway] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [flyaway]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentLikes]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLikes](
	[UserId] [int] NOT NULL,
	[CommentId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CommentLikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](300) NOT NULL,
	[PublishedAt] [datetime2](7) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogEntries]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Actor] [nvarchar](max) NOT NULL,
	[ActorId] [int] NOT NULL,
	[CommitedAt] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NOT NULL,
	[UseCaseData] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LogEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[PublishedAt] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 06.09.2024. 17:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240828204217_initial migration', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904224122_added users table', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240905185145_added tables', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240906000458_added commentlikes table', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240906031222_commentlike id added', N'7.0.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240906124836_added logentries table', N'7.0.20')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Cetvrta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (12, N'Deseta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (11, N'Deveta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Druga')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (13, N'Jedanaesta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (10, N'Osma')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Peta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Prva')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Sedma')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Sesta')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Treca')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentLikes] ON 

INSERT [dbo].[CommentLikes] ([UserId], [CommentId], [Id]) VALUES (2, 1, 2)
INSERT [dbo].[CommentLikes] ([UserId], [CommentId], [Id]) VALUES (1, 4, 5)
INSERT [dbo].[CommentLikes] ([UserId], [CommentId], [Id]) VALUES (2, 4, 6)
SET IDENTITY_INSERT [dbo].[CommentLikes] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Content], [PublishedAt], [PostId], [UserId]) VALUES (1, N'Ovo je test komentar', CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Comments] ([Id], [Content], [PublishedAt], [PostId], [UserId]) VALUES (2, N'ovo je test komentar 2', CAST(N'2024-09-06T02:42:02.9051542' AS DateTime2), 1, 2)
INSERT [dbo].[Comments] ([Id], [Content], [PublishedAt], [PostId], [UserId]) VALUES (4, N'asdasdasdasdas', CAST(N'2024-06-08T00:00:00.0000000' AS DateTime2), 1, 2)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[LogEntries] ON 

INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (1, N'Pera123', 1, CAST(N'2024-09-06T13:00:34.6773384' AS DateTime2), N'Get single user using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (2, N'Pera123', 1, CAST(N'2024-09-06T13:01:20.4767717' AS DateTime2), N'Posts search', N'{"Keyword":null,"Id":0,"Title":null,"Content":null,"PublishedBefore":null,"PublishedAfter":null,"UserId":null,"CategoryId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (3, N'Pera123', 1, CAST(N'2024-09-06T13:21:12.9170931' AS DateTime2), N'LogEntries search', N'{"ActorId":null,"Actor":null,"CommitedBefore":null,"CommitedAfter":null,"UseCaseName":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (4, N'Pera123', 1, CAST(N'2024-09-06T13:22:15.8469335' AS DateTime2), N'LogEntries search', N'{"ActorId":null,"Actor":"pera123","CommitedBefore":null,"CommitedAfter":null,"UseCaseName":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (5, N'Pera123', 1, CAST(N'2024-09-06T13:34:51.7392406' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Title":"Ovo je treci post","Content":"Content treceg posta","ImageUrl":"https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg","PublishedAt":"0001-01-01T00:00:00","UserId":2,"CategoryId":3,"Tags":[1,3]}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (6, N'Pera123', 1, CAST(N'2024-09-06T13:35:06.4391737' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Title":"Ovo je treci post","Content":"Content treceg posta","ImageUrl":"https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg","PublishedAt":"0001-01-01T00:00:00","UserId":2,"CategoryId":4,"Tags":[1,3]}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (7, N'Pera123', 1, CAST(N'2024-09-06T13:38:03.6707894' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Title":"Ovo je treci post","Content":"Content treceg posta","ImageUrl":"https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg","PublishedAt":"0001-01-01T00:00:00","UserId":2,"CategoryId":4,"Tags":[1,32]}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (8, N'Pera123', 1, CAST(N'2024-09-06T13:38:54.9492932' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Title":"Ovo je cetvrti post","Content":"Content cetvrtog posta","ImageUrl":"https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg","PublishedAt":"0001-01-01T00:00:00","UserId":2,"CategoryId":4,"Tags":[1,3]}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (9, N'Pera123', 1, CAST(N'2024-09-06T13:39:33.9340299' AS DateTime2), N'Get single post using EF', N'4')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (10, N'Pera123', 1, CAST(N'2024-09-06T13:41:27.8986517' AS DateTime2), N'Get single post using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (11, N'Pera123', 1, CAST(N'2024-09-06T13:42:45.9668539' AS DateTime2), N'Get single post using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (12, N'Pera123', 1, CAST(N'2024-09-06T13:42:51.4946458' AS DateTime2), N'Get single post using EF', N'4')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (13, N'Pera123', 1, CAST(N'2024-09-06T13:42:56.9472779' AS DateTime2), N'Get single post using EF', N'3')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (14, N'Pera123', 1, CAST(N'2024-09-06T13:43:02.2323002' AS DateTime2), N'Get single post using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (15, N'Pera123', 1, CAST(N'2024-09-06T13:43:18.5429121' AS DateTime2), N'Get single post using EF', N'4')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (16, N'Pera123', 1, CAST(N'2024-09-06T13:43:22.1496411' AS DateTime2), N'Get single post using EF', N'3')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (17, N'Pera123', 1, CAST(N'2024-09-06T13:43:27.6217050' AS DateTime2), N'Get single post using EF', N'2')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (18, N'Pera123', 1, CAST(N'2024-09-06T13:43:31.1917872' AS DateTime2), N'Get single post using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (19, N'Pera123', 1, CAST(N'2024-09-06T14:07:32.6720315' AS DateTime2), N'UserUseCases search', N'{"Id":null,"UserId":null,"UseCaseId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (20, N'Pera123', 1, CAST(N'2024-09-06T14:09:00.1805465' AS DateTime2), N'UserUseCases search', N'{"Id":null,"UserId":null,"UseCaseId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (21, N'Pera123', 1, CAST(N'2024-09-06T14:09:05.6352266' AS DateTime2), N'Get single userusecase using EF', N'6')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (22, N'Pera123', 1, CAST(N'2024-09-06T14:09:12.5709276' AS DateTime2), N'Delete UserUseCase Command using EF', N'6')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (23, N'Pera123', 1, CAST(N'2024-09-06T14:10:01.1680011' AS DateTime2), N'Create New UserUseCase using EF', N'{"Id":0,"UserId":33,"UseCaseId":3}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (24, N'Pera123', 1, CAST(N'2024-09-06T14:10:08.1496810' AS DateTime2), N'Create New UserUseCase using EF', N'{"Id":0,"UserId":3,"UseCaseId":3}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (25, N'Pera123', 1, CAST(N'2024-09-06T14:10:33.8242133' AS DateTime2), N'UserUseCases search', N'{"Id":null,"UserId":1,"UseCaseId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (26, N'Pera123', 1, CAST(N'2024-09-06T14:10:42.6303614' AS DateTime2), N'UserUseCases search', N'{"Id":null,"UserId":3,"UseCaseId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (27, N'djole92', 4, CAST(N'2024-09-06T14:54:01.8031313' AS DateTime2), N'Get single post using EF', N'3')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (28, N'djole92', 4, CAST(N'2024-09-06T14:54:06.7640043' AS DateTime2), N'Get single post using EF', N'1')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (29, N'Pera123', 1, CAST(N'2024-09-06T15:05:37.1690124' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Name":"Prvi"}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (30, N'Pera123', 1, CAST(N'2024-09-06T15:07:25.5940356' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Name":"Cetvrti"}')
INSERT [dbo].[LogEntries] ([Id], [Actor], [ActorId], [CommitedAt], [UseCaseName], [UseCaseData]) VALUES (31, N'Pera123', 1, CAST(N'2024-09-06T15:39:45.5515731' AS DateTime2), N'Create New Tag using EF', N'{"Id":0,"Title":"Naslov test posta","Content":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum est libero, ut imperdiet lorem viverra in. Morbi at molestie mi, ac tincidunt urna.","ImageUrl":"https://cdn.pixabay.com/photo/2023/11/09/19/36/zoo-8378189_640.jpg","PublishedAt":"0001-01-01T00:00:00","UserId":2,"CategoryId":1,"Tags":[1,2]}')
SET IDENTITY_INSERT [dbo].[LogEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Content], [ImageUrl], [PublishedAt], [UserId], [CategoryId]) VALUES (1, N'Test post', N'Ovo je test post', N'imageurlhttp', CAST(N'2024-02-02T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [ImageUrl], [PublishedAt], [UserId], [CategoryId]) VALUES (2, N'Drugi post', N'Ovo je content drugog posta', N'testurl', CAST(N'2024-09-06T02:00:58.9604708' AS DateTime2), 1, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [ImageUrl], [PublishedAt], [UserId], [CategoryId]) VALUES (3, N'Ovo je treci post', N'Content treceg posta', N'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg', CAST(N'2024-09-06T13:35:06.4514075' AS DateTime2), 2, 4)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [ImageUrl], [PublishedAt], [UserId], [CategoryId]) VALUES (4, N'Ovo je cetvrti post', N'Content cetvrtog posta', N'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg', CAST(N'2024-09-06T13:38:54.9618301' AS DateTime2), 2, 4)
INSERT [dbo].[Posts] ([Id], [Title], [Content], [ImageUrl], [PublishedAt], [UserId], [CategoryId]) VALUES (5, N'Naslov test posta', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum est libero, ut imperdiet lorem viverra in. Morbi at molestie mi, ac tincidunt urna.', N'https://cdn.pixabay.com/photo/2023/11/09/19/36/zoo-8378189_640.jpg', CAST(N'2024-09-06T15:39:45.9061097' AS DateTime2), 2, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1, 1)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (4, 1)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (5, 1)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (1, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (5, 2)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (2, 3)
INSERT [dbo].[PostTags] ([PostId], [TagId]) VALUES (4, 3)
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'Cetvrti')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (9, N'Deveti')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'Drugi')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (8, N'Osmi')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'Peti')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'Prvi')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (7, N'Sedmi')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (6, N'sesti')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Treci')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (1, N'Pera123', N'Pera', N'Peric', N'pera123')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (2, N'Mare', N'Marko', N'Markovic', N'mare123')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (3, N'Joca42', N'Jovan', N'Jovanovic', N'joca123')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (4, N'djole92', N'Djordje', N'Djordjevic', N'djole123')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (5, N'john', N'John', N'Smith', N'johnsmith')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Password]) VALUES (6, N'AndyAndy', N'Andy', N'Gomez', N'blackcat123')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 2, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 3, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 1, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 1, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 1, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 1, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 1, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 1, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 1, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 1, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 1, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 1, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 1, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 1, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 1, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 1, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 1, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (35, 1, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (36, 3, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (37, 4, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (38, 4, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (39, 4, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (40, 4, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (41, 4, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (42, 4, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (43, 4, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (44, 4, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (45, 4, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (46, 4, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (47, 4, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (48, 4, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (49, 4, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (50, 4, 32)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentLikes_CommentId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_CommentLikes_CommentId] ON [dbo].[CommentLikes]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentLikes_UserId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_CommentLikes_UserId] ON [dbo].[CommentLikes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Posts_Title]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Posts_Title] ON [dbo].[Posts]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostTags_TagId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_PostTags_TagId] ON [dbo].[PostTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tags_Name]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tags_Name] ON [dbo].[Tags]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 06.09.2024. 17:51:52 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentLikes]  WITH CHECK ADD  CONSTRAINT [FK_CommentLikes_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[CommentLikes] CHECK CONSTRAINT [FK_CommentLikes_Comments_CommentId]
GO
ALTER TABLE [dbo].[CommentLikes]  WITH CHECK ADD  CONSTRAINT [FK_CommentLikes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CommentLikes] CHECK CONSTRAINT [FK_CommentLikes_Users_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts_PostId]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Tags_TagId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [flyaway] SET  READ_WRITE 
GO
