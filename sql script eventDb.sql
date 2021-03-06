USE [master]
GO
/****** Object:  Database [EventsDB]    Script Date: 14/05/2017 11:28:50 ******/
CREATE DATABASE [EventsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EventsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EventsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EventsDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventsDB] SET  MULTI_USER 
GO
ALTER DATABASE [EventsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventsDB] SET QUERY_STORE = OFF
GO
USE [EventsDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EventsDB]
GO
/****** Object:  Table [dbo].[EventDates]    Script Date: 14/05/2017 11:28:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventDates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[NumOfPeople] [int] NOT NULL,
 CONSTRAINT [PK_EventDates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventImages]    Script Date: 14/05/2017 11:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[ImageId] [int] NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_EventDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventMaster]    Script Date: 14/05/2017 11:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventMaster](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nchar](150) NOT NULL,
 CONSTRAINT [PK_EventMaster] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[EventDates] ON 

INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (1, 1, CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-13T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (2, 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), CAST(N'2017-01-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (3, 2, CAST(N'2016-02-02T00:00:00.000' AS DateTime), CAST(N'2016-04-05T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (4, 2, CAST(N'2016-08-02T00:00:00.000' AS DateTime), CAST(N'2016-09-09T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (6, 2, CAST(N'2016-08-01T00:00:00.000' AS DateTime), CAST(N'2017-01-01T00:00:00.000' AS DateTime), 67)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (8, 3, CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (11, 4, CAST(N'2017-12-12T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (12, 5, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (13, 6, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (14, 7, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (15, 8, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (16, 9, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (17, 10, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (18, 11, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (19, 12, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (20, 13, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (21, 14, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (22, 15, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (23, 16, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (24, 17, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (25, 18, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 21)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (26, 19, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (27, 20, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (28, 21, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (29, 22, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (30, 23, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (31, 24, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 55555)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (33, 25, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 6666)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (34, 26, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 5656)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (37, 26, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2019-01-01T00:00:00.000' AS DateTime), 57575)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (38, 26, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 45)
INSERT [dbo].[EventDates] ([Id], [EventId], [StartDate], [EndDate], [NumOfPeople]) VALUES (39, 26, CAST(N'2016-01-01T00:00:00.000' AS DateTime), CAST(N'2016-01-01T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[EventDates] OFF
SET IDENTITY_INSERT [dbo].[EventImages] ON 

INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (2, 1, 1, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (3, 1, 2, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (4, 1, 3, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (5, 2, 4, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (6, 2, 5, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (7, 2, 6, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book                                                                                                                                                                                                                                                                ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (8, 3, 7, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (9, 4, 8, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (10, 5, 9, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (11, 6, 10, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (12, 7, 11, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (13, 8, 12, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (14, 9, 13, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (15, 9, 14, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (16, 10, 15, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (17, 10, 16, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (18, 11, 17, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (19, 12, 18, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (20, 13, 19, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (21, 14, 20, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (22, 15, 21, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (23, 16, 22, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (24, 16, 23, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (25, 17, 24, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (26, 18, 25, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (27, 19, 26, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (28, 20, 27, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (29, 21, 28, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (30, 22, 29, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (31, 23, 30, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (32, 24, 31, N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi     ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (33, 25, 32, N'desc32                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
INSERT [dbo].[EventImages] ([Id], [EventId], [ImageId], [Description]) VALUES (34, 26, 33, N'desc33                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
SET IDENTITY_INSERT [dbo].[EventImages] OFF
SET IDENTITY_INSERT [dbo].[EventMaster] ON 

INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (1, N'Event1                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (2, N'Event2                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (3, N'event3                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (4, N'event4                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (5, N'event5                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (6, N'evetn6                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (7, N'event7                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (8, N'evetn8                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (9, N'event9                                                                                                                                                ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (10, N'event10                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (11, N'evetrn11                                                                                                                                              ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (12, N'evetn12                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (13, N'evetn13                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (14, N'evetn14                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (15, N'evetn15                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (16, N'evetn16                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (17, N'evetn17                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (18, N'evetn18                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (19, N'evetn19                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (20, N'evetn20                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (21, N'evetn21                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (22, N'Evetn22                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (23, N'Event23                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (24, N'Event24                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (25, N'Event25                                                                                                                                               ')
INSERT [dbo].[EventMaster] ([EventId], [EventName]) VALUES (26, N'event26                                                                                                                                               ')
SET IDENTITY_INSERT [dbo].[EventMaster] OFF
ALTER TABLE [dbo].[EventDates]  WITH CHECK ADD  CONSTRAINT [FK_EventDates_EventMaster] FOREIGN KEY([EventId])
REFERENCES [dbo].[EventMaster] ([EventId])
GO
ALTER TABLE [dbo].[EventDates] CHECK CONSTRAINT [FK_EventDates_EventMaster]
GO
ALTER TABLE [dbo].[EventImages]  WITH CHECK ADD  CONSTRAINT [FK_EventImages_EventMaster] FOREIGN KEY([EventId])
REFERENCES [dbo].[EventMaster] ([EventId])
GO
ALTER TABLE [dbo].[EventImages] CHECK CONSTRAINT [FK_EventImages_EventMaster]
GO
USE [master]
GO
ALTER DATABASE [EventsDB] SET  READ_WRITE 
GO
