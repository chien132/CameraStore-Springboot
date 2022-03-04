USE [master]
GO
/****** Object:  Database [CamStore]    Script Date: 04/03/2022 15:56:27 ******/
CREATE DATABASE [CamStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CamStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CamStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CamStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CamStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CamStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CamStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CamStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CamStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CamStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CamStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CamStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [CamStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CamStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CamStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CamStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CamStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CamStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CamStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CamStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CamStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CamStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CamStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CamStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CamStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CamStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CamStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CamStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CamStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CamStore] SET RECOVERY FULL 
GO
ALTER DATABASE [CamStore] SET  MULTI_USER 
GO
ALTER DATABASE [CamStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CamStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CamStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CamStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CamStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CamStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CamStore', N'ON'
GO
ALTER DATABASE [CamStore] SET QUERY_STORE = OFF
GO
USE [CamStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[photo] [nvarchar](200) NULL,
	[admin] [bit] NOT NULL,
	[phone] [varchar](15) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[address] [nvarchar](1000) NULL,
	[createdate] [date] NOT NULL,
	[done] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/03/2022 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [bigint] NOT NULL,
	[description] [nvarchar](2000) NOT NULL,
	[image] [nvarchar](250) NOT NULL,
	[discount] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[cate_id] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (2, N'admin', N'123', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (9, N'chien', N'123', N'', N'', N'resources/images/avatar/user-default.png', 0, N'')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'Canon')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'Sony')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'Nikon')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'Pentax')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'Olimpus')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'Fujifilm')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Máy ảnh DSLR')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Máy ảnh Mirrorless')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Ống kính')
INSERT [dbo].[Category] ([id], [name]) VALUES (1002, N'Tripod')
INSERT [dbo].[Category] ([id], [name]) VALUES (1003, N'Phụ kiện')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [CamStore] SET  READ_WRITE 
GO
