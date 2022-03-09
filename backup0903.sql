USE [master]
GO
/****** Object:  Database [CamStore]    Script Date: 09/03/2022 23:00:56 ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 09/03/2022 23:00:56 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 09/03/2022 23:00:56 ******/
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
/****** Object:  Table [dbo].[CartItem]    Script Date: 09/03/2022 23:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[account_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/03/2022 23:00:56 ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 09/03/2022 23:00:56 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 09/03/2022 23:00:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
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
/****** Object:  Table [dbo].[Product]    Script Date: 09/03/2022 23:00:56 ******/
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

INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (2, N'admin', N'123', N'admin@camerastore.com', N'A đờ min', N'resources/images/avatar/user-default.png', 1, N'0123456789')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (9, N'chien', N'123', N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'resources/images/avatar/user-default.png', 0, N'0343506341')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1011, N'chien3', N'1233', N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'resources/images/avatar/user-default.png', 0, N'0343506341')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1013, N'chien4', N'1233', N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'resources/images/avatar/user-default.png', 0, N'0343506341')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1014, N'chien5', N'1233', N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'resources/images/avatar/user-default.png', 0, N'0343506341')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1020, N'chien321', N'123', N'dangminhchien1302@gmail.com', N'Đặng Minh Chiến', N'resources/images/avatar/1020IMG_20220209_220816.jpg', 0, N'0343506341')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1021, N'ThienAn', N'123', N'thienan@gmail.com', N'Hồng Ân', N'resources/images/avatar/271767873_2006504872867449_6986669439442038545_n.jpg', 0, N'0323456789')
INSERT [dbo].[Account] ([id], [username], [password], [email], [fullname], [photo], [admin], [phone]) VALUES (1022, N'chie', N'123', N'en1302@f.com', N'Đặng nef', N'resources/images/avatar/IMG_2523.JPG', 0, N'0343506341')
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
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [address], [createdate], [done]) VALUES (3, 1022, NULL, CAST(N'2022-03-07' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (4, N'Fujifilm X-T3 + lens kit test', 26000000, N'<p>Fujifilm X-T3 + 18-55mm f2.8-4</p>', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (5, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (6, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (7, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (14, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (16, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (17, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (18, N'Fujifilm X-T3 + lens kit', 26000000, N'Fujifilm X-T3 + 18-55mm f2.8-4', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (21, N'Fujifilm X-T3 + lens kit', 26000000, N'<p>Fujifilm X-T3 + 18-55mm f2.8-4</p>', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (25, N'Hồng Ân as as as ass', 999990000, N'<h2>Hồng Ân á</h2><p>&nbsp;</p><p>hello</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>4</td><td>52</td><td>1</td></tr><tr><td>21</td><td>2</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><blockquote><p>quote ne`</p></blockquote><p>&nbsp;</p><p>123</p>', N'resources/images/product/25271767873_2006504872867449_6986669439442038545_n.jpg', 0, 0, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (29, N'Hồng Ân', 999990000, N'<h2>Hồng Ân á</h2><p>&nbsp;</p><p>hello</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>4</td><td>52</td><td>1</td></tr><tr><td>21</td><td>2</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><blockquote><p>quote ne`</p></blockquote><p>&nbsp;</p><p>123</p>', N'resources/images/product/0271767873_2006504872867449_6986669439442038545_n.jpg', 0, 0, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (30, N'Hồng Ân', 999990000, N'<h2>Hồng Ân á</h2><p>&nbsp;</p><p>hello</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>4</td><td>52</td><td>1</td></tr><tr><td>21</td><td>2</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><blockquote><p>quote ne`</p></blockquote><p>&nbsp;</p><p>123</p>', N'resources/images/product/0271767873_2006504872867449_6986669439442038545_n.jpg', 0, 0, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (31, N'Hồng Ân', 999990000, N'<h2>Hồng Ân á</h2><p>&nbsp;</p><p>hello</p><p>&nbsp;</p><figure class="table"><table><tbody><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr><tr><td>4</td><td>52</td><td>1</td></tr><tr><td>21</td><td>2</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table></figure><blockquote><p>quote ne`</p></blockquote><p>&nbsp;</p><p>123</p>', N'resources/images/product/0271767873_2006504872867449_6986669439442038545_n.jpg', 0, 0, 6, 3)
INSERT [dbo].[Product] ([id], [name], [price], [description], [image], [discount], [quantity], [brand_id], [cate_id]) VALUES (32, N'Fujifilm X-T3 + lens kit', 26000000, N'<p>Fujifilm X-T3 + 18-55mm f2.8-4</p>', N'resources/images/product/0DSC_3185.jpg', 0, 3, 6, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account]    Script Date: 09/03/2022 23:00:56 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_Account] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
