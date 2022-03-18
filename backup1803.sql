USE [master]
GO
/****** Object:  Database [CamStore]    Script Date: 19/03/2022 01:24:45 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 19/03/2022 01:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [varchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[admin] [bit] NOT NULL,
	[address] [nvarchar](1000) NULL,
	[photo] [nvarchar](500) NOT NULL,
	[passwordreset] [nchar](100) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 19/03/2022 01:24:45 ******/
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
/****** Object:  Table [dbo].[CartItem]    Script Date: 19/03/2022 01:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[accountid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/03/2022 01:24:45 ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 19/03/2022 01:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[price] [bigint] NOT NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 19/03/2022 01:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[createdate] [date] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[payonline] [bit] NOT NULL,
	[paid] [bit] NULL,
	[confirmed] [bit] NOT NULL,
	[done] [bit] NOT NULL,
	[rejectreason] [nvarchar](500) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19/03/2022 01:24:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [bigint] NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[image] [nvarchar](500) NOT NULL,
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

INSERT [dbo].[Account] ([id], [username], [password], [fullname], [phone], [email], [admin], [address], [photo], [passwordreset]) VALUES (2, N'admin', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Quản lý', N'0523148564', N'admin@camerastore.com', 1, N'Cửa hàng CameraStore', N'resources/images/avatar/2253745023_10159061384828937_4075422269118334252_n.jpg', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [fullname], [phone], [email], [admin], [address], [photo], [passwordreset]) VALUES (9, N'chien', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Đặng Minh Chiến', N'0343506341', N'dangminhchien1302@gmail.com', 0, N'87/6 đường 379', N'resources/images/avatar/9IMG_20220209_220816.jpg', N'E23261F57F478DCFC67BE0074D04777AE7A276202205D03B2F47A3CBD7AAE9CA                                    ')
INSERT [dbo].[Account] ([id], [username], [password], [fullname], [phone], [email], [admin], [address], [photo], [passwordreset]) VALUES (1021, N'HongAn', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Hồng Ân', N'0323456789', N'hongan@gmail.com', 0, N'S501 Vinhomes Grand Park', N'resources/images/avatar/271767873_2006504872867449_6986669439442038545_n.jpg', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [fullname], [phone], [email], [admin], [address], [photo], [passwordreset]) VALUES (1022, N'chienne', N'A665A45920422F9D417E4867EFDC4FB8A04A1F3FFF1FA07E998E86F7F7A27AE3', N'Chiến nè', N'0343506344', N'n17dccn018@student.ptithcm.edu.vn', 0, N'97 Man Thiện, P. Hiệp Phú, TP. Thủ Đức', N'resources/images/avatar/IMG_2523.JPG', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'Canon')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'Sony')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'Nikon')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'Pentax')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'Olympus')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'Fujifilm')
INSERT [dbo].[Brand] ([id], [name]) VALUES (1007, N'SanDisk')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Máy ảnh DSLR')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Máy ảnh Mirrorless')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Ống kính')
INSERT [dbo].[Category] ([id], [name]) VALUES (1003, N'Phụ kiện')
INSERT [dbo].[Category] ([id], [name]) VALUES (1009, N'Máy ảnh Film')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (45, 37, 1, 19855000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (46, 37, 1, 25990000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (49, 40, 1, 23990000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (60, 41, 1, 26600000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (63, 44, 1, 39990000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (65, 48, 1, 169000000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (70, 45, 1, 20992500)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (74, 37, 1, 9929600)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (74, 40, 1, 9929600)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (74, 42, 2, 9929600)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (83, 45, 1, 5690500)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (92, 36, 1, 1550000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (92, 43, 2, 1550000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (98, 44, 1, 1478400)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (99, 39, 1, 9500000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (99, 47, 1, 9500000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (101, 46, 1, 1190000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (102, 38, 1, 902000)
INSERT [dbo].[OrderDetail] ([product_id], [order_id], [amount], [price]) VALUES (102, 43, 1, 902000)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (36, 9, N'87/6 đường 379', CAST(N'2022-02-17' AS Date), N'chien@email.com', N'Đặng Minh Chiến', N'0343506342', 0, 0, 1, 1, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (37, 9, N'87/6 Đường 379, Tăng Nhơn Phú A, Q.9', CAST(N'2022-03-01' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 1, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (38, 9, N'87/6 đường 379', CAST(N'2022-03-15' AS Date), N'chien@email.com', N'Đặng Minh Chiến', N'0343506342', 0, 0, 1, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (39, 1022, N'Ở đâu không nói', CAST(N'2022-03-17' AS Date), N'en1302@f.com', N'Đặng nef', N'0343506341', 0, 0, 0, 0, N'Địa chỉ không phù hợp')
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (40, 1021, N'S501 Vinhomes Grand Park, TP. Thủ Đức', CAST(N'2022-03-17' AS Date), N'hongan@gmail.com', N'Hồng Ân', N'0323456789', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (41, 9, N'87/6 đường 379', CAST(N'2022-03-17' AS Date), N'chien@email.com', N'Đặng Minh Chiến', N'0343506342', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (42, 9, N'87/6 đường 379', CAST(N'2022-03-17' AS Date), N'chien@email.com', N'Đặng Minh Chiến', N'0343506342', 0, 0, 1, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (43, 9, N'87/6 đường 379', CAST(N'2022-03-17' AS Date), N'chien@email.com', N'Đặng Minh Chiến', N'0343506342', 0, 0, 1, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (44, 9, N'87/6 đường 379', CAST(N'2022-03-19' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (45, 9, N'87/6 đường 379', CAST(N'2022-03-19' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (46, 9, N'87/6 đường 379', CAST(N'2022-03-19' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (47, 9, N'87/6 đường 379', CAST(N'2022-03-19' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 0, 0, NULL)
INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [email], [fullname], [phone], [payonline], [paid], [confirmed], [done], [rejectreason]) VALUES (48, 9, N'87/6 đường 379', CAST(N'2022-03-19' AS Date), N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'0343506341', 0, 0, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (45, N'Ống kính Fujifilm XF 56mm f/1.2 R', 20900000, N'<p>- Ngàm X / APS-C</p><p>- Khẩu độ f/1.2-16</p><p>- 2 thấu kính phi cầu và 2 thấu kính ED</p><p>- Tráng phủ&nbsp;đa lớp HT-EBC</p><p>- Tốc độ lấy nét tự động và cơ chế lấy nét nhanh chóng</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0561.2.jpg', 5, 23, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (46, N'Fujifilm X-T3 WW (Chính hãng)', 25990000, N'<p>- Cảm biến BSI CMOS 4 X-Trans APS-C 26.1MP&nbsp;</p><p>- Bộ xử lý hình ảnh X-Processor 4 với Quad CPU</p><p>- Màn hình LCD 3.0" 1.04m-Dot,&nbsp;cảm ứng, lật 3 hướng</p><p>- Kính ngắm điện tử OLED 3.69m-Dot, độ phóng đại 0.75x</p><p>- Quay phim UHD 4K60; mã màu F-Log Gamma và xuất 10-Bit</p><p>- Tốc độ chụp liên tiếp lên đến 30fps</p><p>- Hệ thống lấy nét tự động nhận diện theo pha 2.16m-Point</p><p>- ISO mở rộng đến 80-51200</p><p>-&nbsp;Chế độ Sports Finder, giả lập phim ETERNA</p><p>- Kết nối Bluetooth 4.2 và Wi-Fi</p><p>- Thiết kế thân máy kháng thời tiết với chất liệu hợp kim magie</p><p><strong>- Phiên bản WW (Worldwide) mới không kèm sẵn sạc BC-126s và đèn flash cóc EF-X8</strong></p>', N'resources/images/product/01536247363000_1433839_s66y-bx.jpg', 0, 24, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (47, N'Fujifilm X-T20', 16990000, N'<p>- Cảm biến CMOS&nbsp;III X-Trans APS-C 24.3MP</p><p>- Bộ xử lý hình ảnh X-Processor Pro</p><p>- Màn hình&nbsp;cảm ứng LCD 3" 1.04m-Dot</p><p>- Kính ngắm 2.36m-Dot</p><p>- Quay phim UHD 4K 30p</p><p>- Tốc độ chụp liên tiếp lên đến 14fps</p><p>- Hệ thống lấy nét tự động&nbsp;Custom AF-C&nbsp;91 điểm</p><p>- ISO mở rộng đến 51200</p><p>- Chế độ Film Simulation cho ảnh và phim</p><p>- Tích hợp kết nối Wi-Fi</p>', N'resources/images/product/0Fujifilm-X-T20_01.jpg', 0, 10, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (48, N'Fujifilm X-T30 II (Chính hãng)', 21990000, N'<p>- Cảm biến APS-C X-Trans BSI CMOS 4 26.1MP</p><p>- Vi xử lý hình ảnh X-Processor 4 với 4 CPU</p><p>- Quay video 4K DCI &amp; UHD; F-Log Gamma</p><p>- Ống ngắm điện tử OLED 2.36 triệu điểm ảnh</p><p>- Màn hình cảm ứng LCD 3.0" 1.04 triệu điểm ảnh, thiết kế lật</p><p>- AF 425 điểm theo pha</p><p>- Màn trập cơ &amp; điện tử</p><p>- ISO mở rộng 80-51200, chụp đến 30 fps</p><p>- Tích hợp Bluetooth &amp; Wi-Fi; chế độ Sports Finder</p><p>- Làm sạch cảm biến dao động siêu âm</p>', N'resources/images/product/0Fujifilm-X-T30_01.jpg', 0, 5, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (49, N'Fujifilm X-S10 (Chính hãng)', 23990000, N'<p>- Cảm biến APS-C BSI CMOS X-Trans 4 26.1MP</p><p>- Chip xử lý hình ảnh X-Processor 4</p><p>- Ổn định hình ảnh trong thân máy 5 trục</p><p>- Quay phim 4K DCI/UHD 30 fps, Full HD 240 fps</p><p>- Chụp liên tiếp 8 fps (màn trập cơ);&nbsp;20 fps (màn trập điện tử)</p><p>- ISO&nbsp;160-12800 (mở rộng 80-51200)</p><p>- Hybrid AF,&nbsp;PDAF&nbsp;425 điểm</p><p>- EVF OLED 2.36 triệu điểm ảnh</p><p>- Màn hình cảm ứng LCD 3.0" 1.04 triệu điểm ảnh, vari-angle</p><p>- Tích hợp Wi-Fi, Bluetooth</p><p>- 1 khay thẻ nhớ SD</p>', N'resources/images/product/0Fujifilm-X-S10.jpg', 0, 2, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (53, N'Sony A6000', 13990000, N'<p>- Cảm biến&nbsp;CMOS&nbsp;APS-C Exmor APS HD 24.3MP&nbsp;</p><p>- Bộ xử lý hình ảnh BIONZ X</p><p>- Màn hình&nbsp;LCD&nbsp;3.0" 921k-Dot</p><p>- Kính ngắm điện tử&nbsp;OLED Tru-Finder 0.39" 1,440k-Dot</p><p>- Quay phim&nbsp;Full HD 1080p XAVC S 24/60fps</p><p>- Tốc độ chụp liên tiếp lên đến&nbsp;11fps</p><p>- Hệ thống lấy nét tự động theo pha Fast Hybrid 179 điểm</p><p>- ISO 25600</p><p>- Tích hợp kết nối Wi-Fi với NFC</p>', N'resources/images/product/53SonyA6000.jpg', 18, 20, 2, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (54, N'Sony Alpha a6400', 22990000, N'<p>- Cảm biến CMOS Exmor APS-C 24.2MP&nbsp;</p><p>- Bộ xử lý hình ảnh BIONZ X</p><p>- EVF OLED XGA Tru-Finder 2.36m-Dot</p><p>- Màn hình cảm ứng, lật 180° 3.0" 921.6k-Dot</p><p>- Quay video UHD 4K nội bộ, S-Log3, HLG</p><p>- Quay S&amp;Q Motion ở chế độ Full HD từ 1-120 fps</p><p>- Hệ thống AF nhận diện pha và tương phản 425 điểm</p><p>- Real-Time Eye AF; Real-Time Tracking</p><p>- Chụp liên tiếp đến 11 fps</p><p>- ISO mở rộng&nbsp;100-102400</p><p>- Tích hợp Wi-Fi với NFC</p>', N'resources/images/product/0SonyA6400.jpg', 0, 13, 2, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (55, N'Sony Alpha a7 III', 44990000, N'<p>- Cảm biến CMOS BSI Full frame 24MP</p><p>- Bộ xử lý hình ảnh BIONZ X và Front-End LSI</p><p>- Màn hình cảm ứng LCD 3.0" 922k-Dot</p><p>- Quay phim UHD 4K30p</p><p>- Tốc độ chụp liên tiếp lên đến 10fps</p><p>-&nbsp;Hệ thống lấy nét tự động với 693 điểm lấy nét</p><p>- ISO 204800</p><p>-&nbsp;Hệ thống ổn định hình ảnh 5 trục</p><p>- Khe cắm thẻ SD đôi</p><p>-&nbsp;Cổng USB loại C</p><p>- Tích hợp kết nối Wi-Fi với NFC</p><p>-&nbsp;Thiết kế chống chịu thời tiết</p>', N'resources/images/product/0sony_ilce_7m3_alpha_a7_iii_mirrorless_1394217.jpg', 4, 3, 2, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (56, N'Sony Alpha a7 IV', 59990000, N'<p>- Cảm biến full fame BSI Exmor R CMOS 33MP&nbsp;</p><p>- Vi xử lý hình ảnh BIONZ XR</p><p>- Chụp liên tiếp đến 10 fps, ISO 100-51200</p><p>- Quay phim 4K 60p 10 bit, hỗ trợ S-Cinetone</p><p>- EVF 3.68 triệu điểm ảnh với refresh rate 120 fps</p><p>- Màn hình cảm ứng LCD 3" 1.03 triệu điểm ảnh, vari-angle</p><p>- Fast Hybrid AF 759 điểm, Real-time Eye AF</p><p>- Cân bằng Focus Breathing</p><p>- Ổn định hình ảnh SteadyShot 5 trục</p><p>- Creative Look, Soft Skin Effect</p><p>- Stream 4K 15p UVC/UAC qua cổng USB Type-C</p>', N'resources/images/product/0sony_a7m4.jpg', 0, 6, 2, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (57, N'Canon EOS M200 + Kit 15-45mm', 15990000, N'<p>- Cảm biến APS-C CMOS 24MP</p><p>- Bộ xử lý hình ảnh DIGIC 8</p><p>- Màn hình LCD cảm ứng 3" 1.04 triệu điểm, lật lên 180 độ</p><p>- Quay phim 4K lên đến 25 fps</p><p>- Hệ thống lấy nét tự động Dual Pixel CMOS AF</p><p>- ISO 100-25600 (mở rộng đến 51200)</p><p>- Tích hợp Wi-Fi và Bluetooth</p><p>- Ống kính kit EF-M 15-45mm f/3.5-6.3 IS STM</p><p>- Phiên bản màu sắc: đen, trắng</p>', N'resources/images/product/0EOS_M200.jpg', 6, 10, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (58, N'Canon EOS M50 Mark II + Kit 15-45mm', 20990000, N'<p>- Cảm biến APS-C CMOS&nbsp;24.1MP</p><p>- Chip xử lý hình ảnh DIGIC 8</p><p>- Quay phim 4K UHD, HD 720p120</p><p>- Dual Pixel CMOS AF + Eye Detect AF</p><p>-&nbsp;Chụp liên tiếp 10 fps</p><p>- ISO&nbsp;100-25600 (mở rộng đến 51200)</p><p>- EVF OLED&nbsp;2.36 triệu điểm</p><p>- Màn hình cảm ứng LCD 3.0" 1.04 triệu điểm, xoay lật</p><p>- Tích hợp đèn flash</p><p>- 1 khay thẻ nhớ</p><p>- Kết nối không dây Wi-Fi, Bluetooth</p><p>- Ống kính kit&nbsp;EF-M 15-45mm f/3.5-6.3 IS STM</p>', N'resources/images/product/0EOS_M50.jpg', 0, 4, 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (59, N'Canon EOS R', 42490000, N'<p>- Cảm biến CMOS Full-Frame&nbsp;30.3MP&nbsp;</p><p>- Bộ xử lý hình ảnh DIGIC 8</p><p>- Quay phim UHD 4K30; xuất C-Log và HDMI 10-Bit&nbsp;</p><p>- Hệ thống lấy nét tự động Dual Pixel CMOS, 5655 điểm lấy nét tự động</p><p>- Kính ngắm điện tử OLED 3.69m-Dot&nbsp;</p><p>- Màn hình cảm ứng, xoay lật LCD 3.15" 2.1m-Dot</p><p>- ISO mở rộng đến 50-102400</p><p>- Chụp liên tiếp 8fps</p><p>- Kết nối Wi-Fi và Bluetooth</p><p>- Khe thẻ nhớ SD UHS-II</p><p>- Thanh đa chức năng Multi-Function Bar, Dual Pixel RAW</p>', N'resources/images/product/0EOS_R.jpg', 0, 3, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (60, N'Canon EOS RP', 38000000, N'<p>- Cảm biến CMOS full frame 26.2MP</p><p>- Bộ xử lý hình ảnh DIGIC 8</p><p>- Quay phim 4K</p><p>- Chụp liên tiếp 5fps</p><p>- Hệ thống lấy nét tự động Dual Pixel CMOS AF</p><p>- Kính ngắm điện tử OLED 2.36m-Dot&nbsp;</p><p>- Màn hình cảm ứng, xoay lật LCD 3.0''''</p><p>- ISO 100 - 40000 (mở rộng đến 50, 51200, 102400)</p><p>- Tích hợp DLO, RAW, tương thích C-RAW</p><p>- Kết nối Wi-Fi và Bluetooth</p>', N'resources/images/product/0EOSRP.jpg', 30, 5, 1, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (61, N'Olympus PEN-F', 27500000, N'<p>- Cảm biến&nbsp;Live MOS 20.3MP</p><p>- Bộ xử lý hình ảnh TruePic VII</p><p>- Màn hình cảm ứng LCD 3.0" 1.037m-Dot</p><p>- Kính ngắm điện tử OLED 2.36m-Dot</p><p>- Quay phim Full HD 1080p 60fps</p><p>- Tốc độ chụp liên tiếp lên đến&nbsp;10fps</p><p>- ISO 200-25600 (mở rộng đến 80-25600)</p><p>- Quay phim Time-lapse 4K</p><p>-&nbsp;Chế độ chụp&nbsp;High Res Shot 50MP</p><p>-&nbsp;Ổn định hình ảnh 5 trục</p><p>- Cổng&nbsp;HDMI, USB 2.0</p><p>- Tích hợp kết nối Wi-Fi</p><p>- Thiết kế hoài cổ, có hai màu: đen, bạc</p>', N'resources/images/product/0olympus_pen.jpg', 13, 2, 5, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (62, N'Nikon Z5', 35500000, N'<p>- Cảm biến CMOS FX 24.3MP</p><p>- Chip xử lý hình ảnh EXPEED 6</p><p>- Quay video 4K UHD và Full HD</p><p>- EVF OLED 3.6 triệu điểm&nbsp;</p><p>- LCD 3.2"&nbsp;cảm ứng lật 1.04 triệu điểm</p><p>- Chụp nhanh đến 4.5 fps</p><p>-&nbsp;ISO 100-51200 (mở rộng 50-102400)</p><p>- Chống rung&nbsp;Vibration Reduction sensor-shift&nbsp;5 trục</p><p>- Hybrid AF&nbsp;273&nbsp;điểm</p><p>-&nbsp;Tích hợp kết nối Wi-Fi, Bluetooth</p>', N'resources/images/product/0Nikon_Z5.jpg', 0, 6, 3, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (63, N'Nikon Z6', 39990000, N'<p>Cảm biến CMOS BSI định dạng FX 24.5MP</p><p>- Động cơ xử lý hình ảnh&nbsp;EXPEED 6</p><p>- Màn hình LCD&nbsp;cảm ứng xoay lật 3.2"&nbsp;2.1m-Dot</p><p>- Kính ngắm điện tử&nbsp;0.80x 3.6m-Dot với thấu kính NIKKOR</p><p>- Quay phim 4K30 UHD với N-Log</p><p>- Tốc độ chụp liên tiếp lên đến 12fps</p><p>- Hệ thống lấy nét tự động theo pha&nbsp;lai 273 điểm,&nbsp;bao phủ 90% vùng ảnh</p><p>- ISO 100-51200</p><p>- Công nghệ ổn định hình ảnh 5 trục&nbsp;Vibration Reduction tích hợp</p><p>- Màn hình&nbsp;OLED ma trận điểm ở mặt trên</p><p>- Khe thẻ nhớ&nbsp;XQD&nbsp;</p><p>- Cổng xuất video HDMI 10-Bit</p><p>- Tích hợp kết nối Wi-Fi, Bluetooth</p>', N'resources/images/product/0Nikon_Z6.jpg', 0, 6, 3, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (64, N'Nikon Z7', 61490000, N'<p>- Cảm biến CMOS BSI định dạng FX 45.7MP</p><p>- Động cơ xử lý hình ảnh&nbsp;EXPEED 6</p><p>- Màn hình LCD&nbsp;cảm ứng xoay lật 3.2"&nbsp;2.1m-Dot</p><p>- Kính ngắm điện tử&nbsp;0.80x 3.6m-Dot với thấu kính NIKKOR</p><p>- Quay phim 4K30 UHD với N-Log</p><p>- Tốc độ chụp liên tiếp lên đến 9fps</p><p>- Hệ thống lấy nét tự động theo pha&nbsp;lai&nbsp;493&nbsp;điểm,&nbsp;bao phủ 90% vùng ảnh</p><p>- ISO 64-25600</p><p>- Công nghệ ổn định hình ảnh 5 trục&nbsp;Vibration Reduction tích hợp</p><p>- Màn hình&nbsp;OLED ma trận điểm ở mặt trên</p><p>- Chế độ quay phim&nbsp;Time-lapse&nbsp;8K</p><p>- Khe thẻ nhớ&nbsp;XQD&nbsp;</p><p>- Cổng xuất video HDMI 10-Bit</p><p>- Tích hợp kết nối Wi-Fi, Bluetooth</p>', N'resources/images/product/0Nikon_Z7.jpg', 0, 5, 3, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (65, N'Canon EOS-1D X Mark III', 169000000, N'<p>- Cảm biến FF CMOS 20.1MP &amp; vi xử lý DIGIC X</p><p>- Chụp liên tiếp 16 fps (OVF) / 20 fps (LCD)</p><p>- Quay video 5.5K RAW 60p, 4K DCI/UHD 60p</p><p>- Hỗ trợ&nbsp; tỉ lệ crop full width DCI, 1.3x crop</p><p>- Hệ thống lấy nét EOS iTR AF X 191 điểm</p><p>- Kết hợp Canon Dual Pixel CMOS AF 525 vùng tùy chọn</p><p>- ISO 100-102,400 (mở rộng đến ISO 819,200)</p><p>- Kết nối không dây Wi-Fi, GPS, Bluetooth tích hợp hoặc adapter WFT-E9</p><p>- Kết nối dây Gigabyte Ethernet tốc độ cao, USB C</p><p>- 2 khay thẻ nhớ CFexpress</p><p>- Thân máy magne bền cao, tuổi thọ màn trập 500,000</p>', N'resources/images/product/0EOS_1DX.jpg', 0, 1, 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (66, N'Canon EOS 90D', 32490000, N'<p>- Cảm biến APS-C CMOS 32.5MP&nbsp;</p><p>- Bộ xử lý hình ảnh DIGIC 8</p><p>- Màn hình cảm ứng LCD 3" 1.04 triệu điểm</p><p>- Quay phim UHD 4K30p &amp; Full HD 120p</p><p>- Hệ thống AF 45 điểm chữ thập</p><p>- Hệ thống&nbsp;Dual Pixel CMOS AF&nbsp;5481 điểm</p><p>- ISO 100-25600 (mở rộng đến 51200)</p><p>- Chụp liên tiếp 11 fps</p><p>- Tích hợp Wi-Fi &amp; Bluetooth</p><p>-&nbsp;EOS iTR AF, màn trập điện tử</p><p>- Cảm biến đo sáng AE 220000 pixel</p>', N'resources/images/product/0EOS_90D.jpg', 0, 6, 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (67, N'Canon EOS 850D', 24990000, N'<p>- Cảm biến APS-C CMOS 24.1MP&nbsp;</p><p>- Vi xử lý hình ảnh DIGIC 8</p><p>- Màn hình cảm ứng&nbsp;3" 1.04 triệu điểm ảnh, xoay lật nhiều góc</p><p>- Quay video UHD 4K 24p, có hỗ trợ quay chiều dọc</p><p>- Hệ thống lấy nét 45 điểm theo pha, kết hợp Canon Dual Pixel CMOS AF</p><p>- Chụp liên tiếp 7 fps, ISO&nbsp;100-25600 (H: 51200)</p><p>- Tích hợp Wi-Fi với NFC, Bluetooth</p>', N'resources/images/product/0EOS_850D.jpg', 0, 3, 1, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (68, N'Nikon D850', 79000000, N'<p>- Cảm biến CMOS&nbsp;BMP định dạng FX 45.7MP</p><p>- Bộ xử lý hình ảnh EXPEED&nbsp;5</p><p>- Màn hình cảm ứng LCD 3.2" 2.36m-Dot</p><p>- Quay phim&nbsp;UHD 4K 30p</p><p>- Tốc độ chụp liên tiếp lên đến 7fps</p><p>- Hệ thống lấy nét tự động 153 điểm</p><p>- ISO 64-25600 (mở rộng đến 32-102400)</p><p>- Cảm biến&nbsp;RGB 180k Pixel</p><p>- Có màn hình&nbsp;Live View</p><p>- Chế độ Silent Shooting cải tiến</p><p>- Khe cắm SD&nbsp;hỗ trợ UHS-II</p><p>- Tích hợp kết nối Wi-Fi, Bluetooth,&nbsp;SnapBridge</p>', N'resources/images/product/0D850.jpg', 19, 4, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (69, N'Nikon D750', 48530000, N'<p>- Cảm biến CMOS định dạng FX 24.3MP</p><p>- Bộ xử lý hình ảnh EXPEED 4</p><p>- Màn hình LCD 3.2" 1229k-Dot</p><p>- Quay phim&nbsp;Full HD 1080p 60fps</p><p>- Tốc độ chụp liên tiếp lên đến&nbsp;6.5fps</p><p>- Hệ thống lấy nét tự động&nbsp;Multi-CAM 3500FX II 51 điểm&nbsp;</p><p>- ISO&nbsp;100-12800 (mở rộng đến 51200)</p><p>-&nbsp;Cảm biến RGB 91k-Pixel và Group Area AF</p><p>- Quay phim Time-lapse và chụp phơi sáng mượt mà</p><p>- Tích hợp kết nối Wi-Fi</p>', N'resources/images/product/0D750.jpg', 41, 2, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (70, N'Nikon D7500', 27990000, N'<p>- Cảm biến CMOS 20.9MP</p><p>- Bộ xử lý hình ảnh EXPEED 5</p><p>- Màn hình cảm ứng, xoay lật LCD 3.2"&nbsp;922k-Dot</p><p>- Kính ngắm quang học, độ phủ 100%, phóng đại 0.94x</p><p>- Quay phim 4K UHD (30/25/24p) ở chế độ crop 1.5x, Full HD 60/50p không crop</p><p>- Tốc độ chụp liên tiếp lên đến 8fps</p><p>- Hệ thống lấy nét tự động&nbsp;Multi-CAM 3500FX II 51 điểm</p><p>- ISO&nbsp;100-51200 (mở rộng đến 50-1.638.400)</p><p>- Cảm biến đo sáng 180k-Pixel RGB và Group Area AF</p><p>- Khe thẻ nhớ SD/SDHC/SDXC, hỗ trợ UHS-II&nbsp;</p><p>- Tích hợp kết nối Wi-Fi, Bluetooth,&nbsp;SnapBridge&nbsp;</p>', N'resources/images/product/0D7500.jpg', 25, 6, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (71, N'Nikon D610', 34200000, N'<p>- Cảm biến CMOS định dạng&nbsp;FX 24.3MP</p><p>- Bộ xử lý hình ảnh EXPEED 3</p><p>- Màn hình LCD 3.2" 921k-Dot</p><p>- Quay phim Full HD 1080p 30fps</p><p>- Tốc độ chụp liên tiếp lên đến 6fps</p><p>- Hệ thống lấy nét tự động&nbsp;Multi-CAM 4800 39 điểm</p><p>- ISO mở rộng đến 25600</p><p>-&nbsp;Tích hợp đèn flash với chế độ Commander</p><p>-&nbsp;Hỗ trợ adapter WU-1b cho kết nối Wi-Fi và GPS</p>', N'resources/images/product/036085_Nikon_D610_3.jpg', 42, 5, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (72, N'Nikon D5600 + Kit 18-55mm', 15900000, N'<p>- Cảm biến CMOS&nbsp;APS-C 24MP</p><p>- Bộ xử lý hình ảnh EXPEED 4</p><p>- Màn hình&nbsp;LCD cảm ứng, xoay lật 3.2" 1,037k-Dot</p><p>- Tốc độ chụp liên tiếp lên đến 5fps</p><p>- ISO&nbsp;100-25600</p><p>- Tích hợp kết nối Wi-Fi với NFC, Snapbridge</p><p>- Ống kính AF-P DX 18-55mm f/3.5-5.6G VR</p>', N'resources/images/product/0may-anh-nikon-d5600_-_003.jpg', 12, 4, 3, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (73, N'Fujifilm XF 50mm f/1 R WR', 37490000, N'<p>- Ngàm X / APS-C</p><p>- Tiêu cự 76mm (tương đương 35mm)</p><p>- Khẩu độ: f/1 đến f/16</p><p>- 1 thấu kính phi cầu, 2&nbsp;thấu kính&nbsp;tán xạ cực thấp</p><p>- Lớp phủ&nbsp;Super EBC</p><p>- 9 lá khẩu tròn</p><p>- Thiết kế kháng thời tiết</p>', N'resources/images/product/0XF50mmF1R.jpg', 0, 6, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (74, N'Fujifilm XF 18-55mm f/2.8-4 R LM OIS', 17120000, N'<p>- Ngàm X định dạng APS-C</p><p>- Khẩu độ f/2.8&nbsp;</p><p>- Ổn định hình ảnh quang học</p><p>- Tốc độ lấy nét cực nhanh, êm ái</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Fujifilm_XF_18_55mm_f_2_8_4_OIS_883530.jpg', 42, 1, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (75, N'Sony E 16-55mm f/2.8 G', 29990000, N'<p>- Ngàm E / APS-C</p><p>- Tiêu cự 24-82.5mm (tương đương 35mm)</p><p>- Khẩu độ: f/2.8 - f/22</p><p>- 4 thấu kính phi cầu &amp; 3 thấu kính&nbsp;Extra-Low Dispersion</p><p>- Tráng phủ Nano AR &amp; Fluorine</p><p>- Hệ thống XD Linear Motor AF</p><p>- Kháng bụi, kháng ẩm</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0SonyE1655f2.8.jpg', 3, 6, 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (76, N'Sony E 50mm f/1.8 OSS', 6990000, N'<p>- Ngàm E định dạng APS-C</p><p>- Khẩu độ f/1.8-22</p><p>- Ổn định hình ảnh quang học&nbsp;Optical SteadyShot</p><p>- Cơ chế lấy nét trong</p><p>-&nbsp;Khoảng cách lấy nét tối thiểu 1.3''</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0SonyE50mmf1.8.jpg', 0, 10, 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (77, N'Sony E 18-200mm f/3.5-6.3 OSS', 15990000, N'<p>- Ngàm E định dạng APS-C</p><p>- Khẩu độ f/3.5-40</p><p>- 4 thấu kính phi cầu, 1 thấu kính ED</p><p>- Ổn định hình ảnh quang học&nbsp;Optical SteadyShot</p><p>- Nút gạt khóa zoom</p><p>- Cơ chế lấy nét trong</p><p>- Khoảng cách lấy nét tối thiểu 11.8"</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Sony_SEL_18200LE_18_200mm_f_3_5_6_3_OSS_Lens_863264.jpg', 0, 30, 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (78, N'Sony E 24mm F/1.8 ZA E-Mount Carl Zeiss Sonnar', 20990000, N'<p>- Ngàm E định dạng APS-C</p><p>- Khẩu độ f/1.8-22</p><p>- 2 thấu kính phi cầu và 1 thấu kính ED&nbsp;</p><p>- Tráng phủ Zeiss T* Anti-Reflective</p><p>- Động cơ lấy nét tự động tuyến tính và lấy nét trong</p><p>- Khoảng cách lấy nét tối thiểu 6.3"</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0SonyE24mmF1.8ZAE-MountCarlZeissSonnar.jpg', 0, 2, 2, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (79, N'Nikon AF-S 85mm f/1.8G', 14550000, N'<p>- Ngàm F định dạng FX</p><p>- Khẩu độ f/1.8-16</p><p>- Tráng phủ Super Integrated</p><p>- Động cơ lấy nét tự động siêu thanh Silent Wave Motor</p><p>- Hệ thống lấy nét trong IF</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Nikon85f1.8.jpg', 25, 20, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (80, N'Nikon NIKKOR Z 50mm f/1.8 S', 12990000, N'<p>- Ngàm Z định dạng FX</p><p>- Khẩu độ f/1.8-16</p><p>- 2 thấu kính tán xạ cực thấp và 2 thấu kính phi cầu</p><p>- Tráng phủ Nano Crystal và Super Integrated</p><p>- Động cơ lấy nét tự động chuyển động bước</p><p>- Vòng điều khiển lập trình được</p><p>- Thiết kế chống chịu thời tiết&nbsp;</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0nikkorz50f1.8.jpg', 0, 5, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (81, N'Nikon AF-S 70-300mm f/4.5-5.6G IF ED', 15140000, N'<p>- Ngàm F định dạng FX</p><p>- Khẩu độ f/4.5-32</p><p>- 2 thấu kính ED</p><p>- Tráng phủ Super Integrated</p><p>- Động cơ lấy nét tự động Silent Wave Motor</p><p>- Hệ thống ổn định hình ảnh VR&nbsp;II</p><p>- Hệ thống lấy nét trong IF</p><p>- Trình lấy nét thủ công ghi đè toàn thời gian</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0Nikon_AF-S_70-300mm_F45.6G_IF_ED.jpg', 14, 6, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (82, N'Nikon AF-S DX 18-140mm f/3.5-5.6G ED VR', 8840000, N'<p>- Ngàm F định dạng DX</p><p>- Khẩu độ f/3.5-38</p><p>- 1 thấu kính ED và 1 thấu kính phi cầu</p><p>- Tráng phủ Super Integrated</p><p>- Động cơ lấy nét tự động Silent Wave Motor</p><p>- Hệ thống ổn định hình ảnh VR</p><p>- Hệ thống lấy nét trong IF</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Nikon_AF-S_DX_18-140mm_F3.5-5.6G_ED_VR.jpg', 32, 4, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (83, N'Nikon AF-S 50mm f/1.8G', 5990000, N'<p>- Ngàm F định dạng FX</p><p>- Khẩu độ f/1.8-16</p><p>- Tráng phủ Super Integrated</p><p>- Động cơ lấy nét tự động Silent Wave Motor</p><p>- Trình lấy nét thủ công ghi đè toàn thời gian</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Nikon_AFS_50mm_F1.8G.jpg', 5, 15, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (84, N'Nikon AF-S NIKKOR 200-500mm f/5.6E ED', 31990000, N'<p>- Ngàm F định dạng FX</p><p>- Khẩu độ f/5.6</p><p>- 19 thấu kính chia làm 12 nhóm (gồm 3 thấu kính ED)</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0Nikon-AF-S-NIKKOR-200-500mm-f5.jpg', 0, 2, 3, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (85, N'Canon EF-S 18-55mm f/3.5-5.6 IS STM', 2990000, N'<p>- Ngàm EF-S định dạng APS-C</p><p>- Khẩu độ f/3.5-5.6</p><p>- 1 thấu kính phi cầu</p><p>- Động cơ lấy nét tự động chuyển động bước Ultrasonic</p><p>- Ổn định hình ảnh quang học&nbsp;IS</p><p>- Cơ chế lấy nét trong ống kính</p>', N'resources/images/product/0Canon_EF_15-85mm_F3.5-5.6_IS_US_STM.jpg', 0, 5, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (86, N'Canon EF 50mm F/1.8 STM', 3790000, N'<p>- Ngàm EF định dạng Full frame</p><p>- Khẩu độ f/1.8-22</p><p>- 6 thấu kính trong 5 nhóm</p><p>- Động cơ lấy nét tự động chuyển động bước Ultrasonic</p><p>- 7 lá khẩu tròn</p>', N'resources/images/product/0Canon_EF_50mm_F1.8_STM.jpg', 0, 6, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (87, N'Canon EF 24-70mm f/4L IS USM', 26710000, N'<p>- Ngàm EF / Full frame</p><p>- Khẩu độ f/4-22</p><p>- 2&nbsp;thấu kính UD và Super UD</p><p>- Động cơ lấy nét tự động Ultrasonic</p><p>- Ổn định hình ảnh quang học IS</p><p>- Thiết kế chống bụi, chống&nbsp;ẩm</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0CanonEF2470mmf4LISUSM.jpg', 0, 3, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (88, N'Canon EF 85mm f/1.8 USM', 12230000, N'<p>- Ngàm EF định dạng Full frame</p><p>- Khẩu độ f/1.8-22</p><p>- Động cơ lấy nét tự động Ultrasonic&nbsp;</p><p>- Hệ thống lấy nét phía sau</p><p>- Cơ chế lấy nét trong ống kính</p>', N'resources/images/product/0Canon_EF_85mm_F1_922j-xz.8_USM.jpg', 14, 4, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (89, N'Canon EF 24‐70mm f/2.8L II USM', 56970000, N'<p>- Ngàm EF định dạng Full frame</p><p>- Khẩu độ f/2.8-22</p><p>- Thấu kính UD, Super UD và thấu kính phi cầu</p><p>- Động cơ lấy nét tự động Ultrasonic</p><p>- Trình lấy nét thủ công ghi đè toàn thời gian</p><p>- Thiết kế chống chịu thời tiết,&nbsp;tráng phủ Fluorine</p>', N'resources/images/product/0EF2470mmf2.8.jpg', 25, 5, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (90, N'Canon EF 16-35mm f/4L IS USM', 26400000, N'<p>- Ngàm EF định dạng Full frame</p><p>- Khẩu độ f/4-22</p><p>- 2&nbsp;thấu kính UD và 3 thấu kính phi cầu</p><p>- Động cơ lấy nét tự động Ultrasonic</p><p>- Ổn định hình ảnh quang học&nbsp;IS</p><p>- Thiết kế chống chịu thời tiết,&nbsp;tráng phủ Fluorine</p><p>- 9 lá khẩu tròn</p>', N'resources/images/product/0EF1635mmf4.jpg', 7, 7, 1, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (91, N'SanDisk Extreme Pro SDHC 32GB', 1050000, N'<p>- Thẻ nhớ chính hãng Sandisk</p><p>- Tốc độ truyền dữ liệu 95MB/s</p><p>- Hỗ trợ chụp liên tiếp, quay video Full HD</p><p>- Khóa cơ, bảo vệ chống dữ liệu</p><p>- Tương thích tốt với thiết bị chuẩn SDHC</p>', N'resources/images/product/0SD_PRO_32GB_633x.jpg', 57, 60, 1007, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (92, N'Sandisk Extreme Pro UHS-II U3 32GB', 1550000, N'<p>- Thiết kế cao cấp, bền bỉ</p><p>- Tốc độ truyền dữ liệu cực nhanh và ổn định</p><p>- Hỗ trợ quay Video 4K</p><p>- Phục hồi dữ liệu dễ dàng với phần mềm RESCUEPRO® DELUXE</p><p>- Dung lượng lưu trữ thoải mái</p>', N'resources/images/product/0the-nho-sd-ExtremePro-2000x-32gb-1.jpg', 0, 41, 1007, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (93, N'SanDisk Extreme Pro UHS-II U3 64GB', 2750000, N'<p>- Thiết kế cao cấp, bền bỉ</p><p>- Tốc độ truyền dữ liệu cực nhanh và ổn định</p><p>- Hỗ trợ quay Video 4K</p><p>- Phục hồi dữ liệu dễ dàng với phần mềm RESCUEPRO® DELUXE</p><p>- Dung lượng lưu trữ thoải mái</p>', N'resources/images/product/0the-nho-sd-sandisk-ExtremePro-2000x-64gb.jpg', 0, 40, 1007, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (94, N'Pentax K-1 Mark II', 45900000, N'<p>- Cảm biến CMOS Full frame 36.4MP</p><p>- Bộ xử lý hình ảnh PRIME IV</p><p>- Kính ngắm quang học&nbsp;OVF Pentaprism, độ phóng đại&nbsp;0.70x</p><p>- Tốc độ chụp liên tiếp lên đến&nbsp;4.4fps&nbsp;full frame,&nbsp;6.5fps crop&nbsp;APS-C</p><p>- Hệ thống lấy nét tự động SAFOX 33 điểm</p><p>- ISO 819200</p><p>-&nbsp;Công nghệ Pixel-shifting II</p><p>- Hệ thống đo sáng TTL RGB 86000 điểm</p><p>-&nbsp;Hệ thống ổn định hình ảnh 5 trục&nbsp;lên đến 5 bước</p><p>-&nbsp;Tích hợp đèn LED hỗ trợ lấy nét tự động</p><p>- Ngàm ống kính&nbsp;PENTAX KAF2</p>', N'resources/images/product/0pentax-k-1-mark-ii-zshop-2.jpg', 0, 0, 4, 1)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (95, N'Sạc Canon LC-E6', 1330000, N'<p>- Hãng sản xuất: Canon</p><p>- Tên Sản phẩm Canon LC-E6</p><p>- Sử dụng sạc cho Pin Canon LP-E6 dùng cho 5D II, 5D III, 7D, 60D</p><p>- Sử dụng nguồn điện 100 tới 240V</p>', N'resources/images/product/0LC-E6e.jpg', 10, 30, 1, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (96, N'Bộ pin sạc Sony NP-BX1', 610000, N'<p>- Bộ 2 pin 1 sạc</p><p>- Dung lượng&nbsp;1000mAh</p><p>- Đảm bảo an toàn 100%</p><p>- Cổng sạc USB</p>', N'resources/images/product/0Ravpower-RP-BC1001.jpg', 0, 30, 2, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (97, N'Sạc Fujifilm BC-W126S', 1400000, N'<p>- Sạc cho pin Fujifilm NP-W126S</p><p>- Có đèn LED báo trạng thái sạc</p>', N'resources/images/product/01536749424_1433848.jpg', 0, 43, 6, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (98, N'Sạc Nikon MH-25', 1920000, N'<p>- Nikon MH-25 sạc cho Pin EN-EL15</p><p>- Dùng cho Nikon D7000, D7100, D600, D800, D800E</p>', N'resources/images/product/0Nikon_MH_25.jpg', 23, 33, 3, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (99, N'Đèn Flash Nikon Speedlight SB-700', 9500000, N'<p>- Các tính năng đa dạng trong thiết kế nhỏ gọn</p><p>- SB-700 cung cấp khả năng chiếu sáng không dây, khả năng kết nối từ xa với 1 nhóm đèn ( đánh wireless).</p><p>- Tự động dò tìm, phân tích hình ảnh qua các bộ lọc màu sắc.</p><p>- Tự động phát hiện, kiểm soát gia tăng nhiệt độ của đèn</p><p>- Giao diện người dùng trực quan.</p>', N'resources/images/product/0den-Flash-Nikon-Speedlight-SB-700-001.jpg', 0, 10, 3, 1003)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (100, N'Máy Film Canon AE1', 1200000, N'<p>Body máy ảnh Film Canon AE1 ngoại hình đẹp cơ tốc đo sáng tốt.</p><p>Đây là dòng máy ảnh film bán cơ dùng pin 4LR4 để chụp ảnh.</p><p>Rất phù hợp cho các bạn học sinh sinh viên hay mê máy phim mua để tập chụp.</p><p>Lens đi kèm máy thường là 24F2.8, 28F2.8, 50F1.8, 50F1.4, 135F2.5, 135F3.5…</p>', N'resources/images/product/0Canon-AE1.jpg', 10, 3, 1, 1009)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (101, N'Máy Film Pentax Asahi Spotmatic', 1400000, N'<p>Body máy ảnh Film Pentax Asahi Spotmatic ngoại hình đẹp cơ tốc đo sáng tốt.</p><p>Đây là dòng máy ảnh film SLR full cơ không dùng pin vẫn chụp ảnh được.</p><p>Rất phù hợp cho các bạn học sinh sinh viên hay mê máy phim mua để tập làm quen với máy ảnh.</p><p>Lens đi kèm máy thường là 55F1.8, 50F1.4, 135F2.5…</p>', N'resources/images/product/0pentax-spotmatic-.jpg', 15, 3, 4, 1009)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (102, N'Máy Film Full cơ Canon FTb', 1100000, N'<p>Body máy ảnh Film Canon FTb ngoại hình đẹp cơ tốc đo sáng tốt.</p><p>Đây là dòng máy ảnh film SLR full cơ không dùng pin vẫn chụp ảnh.</p><p>Chỉ dùng pin cúc áo để đo sáng, rất phù hợp cho các bạn học sinh sinh viên hay mê máy phim.</p><p>Lens đi kèm máy thường là 50F1.8, 50F1.4, 135F2.5, 135F3.5…</p>', N'resources/images/product/0Canon-FTb.jpg', 18, 1, 1, 1009)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account]    Script Date: 19/03/2022 01:24:45 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_Account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_Cartitem_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_Cartitem_Account]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_Cartitem_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_Cartitem_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Account]
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
