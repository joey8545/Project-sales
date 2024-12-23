USE [master]
GO
/****** Object:  Database [mydata]    Script Date: 2024/11/14 下午 02:13:49 ******/
CREATE DATABASE [mydata]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mydata', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mydata.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mydata_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mydata_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mydata] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mydata].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mydata] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mydata] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mydata] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mydata] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mydata] SET ARITHABORT OFF 
GO
ALTER DATABASE [mydata] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mydata] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mydata] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mydata] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mydata] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mydata] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mydata] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mydata] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mydata] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mydata] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mydata] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mydata] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mydata] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mydata] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mydata] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mydata] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mydata] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mydata] SET RECOVERY FULL 
GO
ALTER DATABASE [mydata] SET  MULTI_USER 
GO
ALTER DATABASE [mydata] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mydata] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mydata] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mydata] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mydata] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mydata] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mydata', N'ON'
GO
ALTER DATABASE [mydata] SET QUERY_STORE = OFF
GO
USE [mydata]
GO
/****** Object:  Table [dbo].[customer_service]    Script Date: 2024/11/14 下午 02:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NOT NULL,
	[texts] [nvarchar](max) NULL,
	[times] [datetime] NULL,
	[GM_times] [datetime] NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 2024/11/14 下午 02:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[birthday] [date] NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetail]    Script Date: 2024/11/14 下午 02:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetail](
	[orderdetailid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[p_name] [nvarchar](50) NOT NULL,
	[counts] [int] NOT NULL,
	[price] [int] NOT NULL,
	[totalprice] [int] NOT NULL,
	[pickupbymyself] [bit] NOT NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderdetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2024/11/14 下午 02:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NULL,
	[totalprice] [int] NOT NULL,
	[orderdate] [datetime] NULL,
	[orderstatus] [nvarchar](50) NOT NULL,
	[orders_p_name] [nvarchar](50) NOT NULL,
	[p_phone] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2024/11/14 下午 02:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sort] [nvarchar](50) NOT NULL,
	[introduce] [nvarchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[counts] [int] NOT NULL,
	[pic_before] [nvarchar](100) NULL,
	[pic_after] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer_service] ON 

INSERT [dbo].[customer_service] ([id], [m_id], [texts], [times], [GM_times], [status]) VALUES (7, 3, N'下午 01:56 Harry: 321
下午 01:57 客服人員: 321
下午 02:04 Harry: 5
下午 02:24 客服人員: 1
', CAST(N'2024-11-05T14:04:29.003' AS DateTime), CAST(N'2024-11-05T14:24:13.947' AS DateTime), N'已回覆')
INSERT [dbo].[customer_service] ([id], [m_id], [texts], [times], [GM_times], [status]) VALUES (10, 2, N'下午 01:32 John: 321
下午 01:32 John: 456
下午 01:48 John: 你好
下午 01:58 John: 5
下午 01:59 客服人員: 你好
上午 09:14 John: 987

上午 09:32 John: 123
上午 09:32 客服人員: 456
', CAST(N'2024-11-07T09:32:20.370' AS DateTime), CAST(N'2024-11-07T09:32:56.680' AS DateTime), N'已回覆')
INSERT [dbo].[customer_service] ([id], [m_id], [texts], [times], [GM_times], [status]) VALUES (11, 8, N'下午 01:35 Duncan: HI
上午 09:01 客服人員: hi

上午 09:01 Duncan: qwe
上午 09:04 客服人員: asd
上午 09:04 客服人員: zxc
', CAST(N'2024-11-11T09:01:28.027' AS DateTime), CAST(N'2024-11-11T09:04:11.230' AS DateTime), N'已回覆')
SET IDENTITY_INSERT [dbo].[customer_service] OFF
GO
SET IDENTITY_INSERT [dbo].[member] ON 

INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (1, N'0', N'0', N'joey', CAST(N'1996-04-05' AS Date), N'0987654321', N'高雄市三民區', N'joey@gmail.com', N'boss')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (2, N'1', N'1', N'John', CAST(N'1998-08-05' AS Date), N'0945678900', N'高雄市鳳山區', N'john@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (3, N'2', N'2', N'Harry', CAST(N'1945-10-05' AS Date), N'0965678912', N'高雄市大寮區', N'Harry@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (4, N'3', N'3', N'Marry', CAST(N'1994-04-30' AS Date), N'0987654915', N'高雄市鳳山區', N'Marry@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (5, N'4', N'4', N'Terry', CAST(N'2000-11-15' AS Date), N'0915975382', N'高雄市鼓山區', N'Terry@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (6, N'5', N'5', N'Amy', CAST(N'1999-07-04' AS Date), N'0935468715', N'高雄市苓雅區', N'Amy@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (7, N'6', N'6', N'Tony', CAST(N'1965-08-14' AS Date), N'0918657895', N'高雄市前鎮區', N'Tony@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (8, N'7', N'7', N'Duncan', CAST(N'1977-01-02' AS Date), N'0964823517', N'高雄市鳳山區', N'Duncan@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (9, N'8', N'8', N'Jeremy', CAST(N'1984-02-03' AS Date), N'0935468715', N'高雄市苓雅區', N'Jeremy@gmail.com', N'customer')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (10, N'00', N'00', N'Eason', CAST(N'1999-05-05' AS Date), N'0997684958', N'高雄市鼓山區', N'eason@gmail.com', N'employee')
INSERT [dbo].[member] ([id], [account], [password], [name], [birthday], [phone], [address], [email], [role]) VALUES (13, N'9', N'9', N'red', CAST(N'1998-10-06' AS Date), N'0968452318', N'高雄市三民區', N'red@gmail.com', N'customer')
SET IDENTITY_INSERT [dbo].[member] OFF
GO
SET IDENTITY_INSERT [dbo].[orderdetail] ON 

INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (1, 1, 9, N'圓桌', 2, 2800, 5600, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (2, 1, 13, N'雙人座沙發', 1, 8800, 8800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (3, 2, 8, N'附櫃腳收納櫃組合', 1, 3600, 3600, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (4, 2, 5, N'收納櫃', 1, 1500, 1500, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (5, 2, 3, N'單人床附床頭板', 2, 3000, 6000, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (6, 3, 9, N'圓桌', 2, 2800, 5600, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (7, 3, 12, N'長桌', 2, 5400, 10800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (8, 4, 1, N'雙人床框', 1, 5000, 5000, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (9, 4, 3, N'單人床附床頭板', 1, 3000, 3000, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (10, 4, 4, N'單人床框附抽屜', 1, 4000, 4000, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (11, 4, 11, N'桌子附掛勾', 1, 3200, 3200, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (12, 5, 12, N'長桌', 1, 5400, 5400, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (13, 5, 14, N'三人座沙發', 1, 10800, 10800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (14, 5, 16, N'三人座沙發附躺椅', 1, 15000, 15000, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (15, 6, 7, N'抽屜櫃', 1, 2200, 2200, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (16, 6, 10, N'桌子附2個椅凳', 1, 4800, 4800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (17, 7, 11, N'桌子附掛勾', 1, 3200, 3200, 0, N'高雄市鳳山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (18, 7, 11, N'桌子附掛勾', 1, 3200, 3200, 0, N'高雄市鳳山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (19, 7, 9, N'圓桌', 1, 2800, 2800, 0, N'高雄市鳳山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (20, 7, 1, N'雙人床框', 1, 5000, 5000, 0, N'高雄市鳳山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (21, 8, 9, N'圓桌', 3, 2800, 8400, 0, N'高雄市大寮區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (22, 8, 11, N'桌子附掛勾', 1, 3200, 3200, 0, N'高雄市大寮區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (23, 8, 1, N'雙人床框', 1, 5000, 5000, 0, N'高雄市大寮區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (24, 8, 4, N'單人床框附抽屜', 1, 4000, 4000, 0, N'高雄市大寮區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (25, 9, 14, N'三人座沙發', 1, 10800, 10800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (26, 10, 6, N'附輪腳抽屜櫃', 1, 1000, 1000, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (27, 10, 7, N'抽屜櫃', 1, 2200, 2200, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (28, 11, 3, N'單人床附床頭板', 1, 3000, 3000, 0, N'高雄市左營區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (29, 12, 9, N'圓桌', 1, 2800, 2800, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (30, 12, 11, N'桌子附掛勾', 1, 3200, 3200, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (31, 12, 5, N'收納櫃', 1, 1500, 1500, 0, N'高雄市鼓山區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (37, 13, 15, N'雙人座沙發床', 1, 12000, 12000, 0, N'屏東縣屏東市')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (38, 13, 13, N'雙人座沙發', 1, 8800, 8800, 0, N'屏東縣屏東市')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (39, 14, 11, N'桌子附掛勾', 1, 3200, 3200, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (40, 14, 9, N'圓桌', 1, 2800, 2800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (41, 15, 28, N'高床框附2收納盒', 1, 8800, 8800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (42, 16, 14, N'三人座沙發', 1, 10800, 10800, 1, N'')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (43, 17, 12, N'長桌', 1, 5400, 5400, 0, N'高雄市梓官區')
INSERT [dbo].[orderdetail] ([orderdetailid], [orderid], [p_id], [p_name], [counts], [price], [totalprice], [pickupbymyself], [address]) VALUES (44, 18, 2, N'雙人軟墊式床框', 2, 7500, 15000, 1, N'')
SET IDENTITY_INSERT [dbo].[orderdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (1, 2, 11520, CAST(N'2024-10-03T16:37:50.523' AS DateTime), N'已送達', N'John', N'0945678912')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (2, 3, 8880, CAST(N'2024-10-15T16:38:46.980' AS DateTime), N'已送達', N'Harry', N'0965678912')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (3, 4, 13120, CAST(N'2024-10-18T16:39:05.193' AS DateTime), N'已送達', N'Marry', N'0987654915')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (4, 6, 12160, CAST(N'2024-10-19T16:41:59.467' AS DateTime), N'已送達', N'Amy', N'0935468715')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (5, 7, 24960, CAST(N'2024-10-20T16:42:51.947' AS DateTime), N'已送達', N'Tony', N'0918657895')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (6, 9, 5600, CAST(N'2024-10-24T16:44:27.050' AS DateTime), N'已送達', N'Jeremy', N'0935468715')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (7, 0, 11360, CAST(N'2024-10-24T16:45:26.523' AS DateTime), N'已送達', N'Jane', N'0918978912')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (8, 0, 16480, CAST(N'2024-10-25T16:50:14.227' AS DateTime), N'已送達', N'Aaron', N'0915879512')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (9, 2, 8640, CAST(N'2024-10-25T16:50:47.200' AS DateTime), N'已送達', N'John', N'0945678912')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (10, 5, 2560, CAST(N'2024-10-28T16:51:43.170' AS DateTime), N'已送達', N'Terry', N'0915975382')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (11, 4, 2900, CAST(N'2024-10-28T16:52:26.650' AS DateTime), N'已送達', N'Marry', N'0987654915')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (12, 7, 6500, CAST(N'2024-10-30T10:29:14.870' AS DateTime), N'已送達', N'Tony', N'0918657895')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (13, 0, 20800, CAST(N'2024-11-04T13:03:44.397' AS DateTime), N'已送達', N'Leon', N'0947158294')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (14, 0, 6000, CAST(N'2024-11-04T13:09:35.860' AS DateTime), N'已送達', N'Ray', N'0986325896')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (15, 8, 7040, CAST(N'2024-11-04T13:13:51.700' AS DateTime), N'已送達', N'Duncan', N'0964823517')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (16, 13, 8640, CAST(N'2024-11-06T09:27:11.440' AS DateTime), N'已送達', N'red', N'0968452318')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (17, 0, 5900, CAST(N'2024-11-06T11:47:36.167' AS DateTime), N'已送達', N'patrick', N'0986987452')
INSERT [dbo].[orders] ([orderid], [m_id], [totalprice], [orderdate], [orderstatus], [orders_p_name], [p_phone]) VALUES (18, 0, 15000, CAST(N'2024-11-11T08:59:51.287' AS DateTime), N'已出貨', N'posh', N'0984659784')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (1, N'雙人床框', N'床', N'松木/luroy', N'150x200 公分', 5000, 47, N'Bed1_before.png', N'Bed1_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (2, N'雙人軟墊式床框', N'床', N'kulsta luroy', N'150x200 公分', 7500, 0, N'Bed2_before.png', N'Bed2_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (3, N'單人床附床頭板', N'床', N'白色/luroy', N'90x200 公分', 3000, 46, N'Bed3_before.png', N'Bed3_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (4, N'單人床框附抽屜', N'床', N'白色', N'90x200 公分', 4000, 8, N'Bed4_before.png', N'Bed4_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (5, N'收納櫃', N'櫃子', N'4隔層, 白色', N'70x35x70 公分', 1500, 26, N'Cabinet1_before.png', N'Cabinet1_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (6, N'附輪腳抽屜櫃', N'櫃子', N'白色', N'28x69 公分', 1000, 18, N'Cabinet2_before.png', N'Cabinet2_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (7, N'抽屜櫃', N'櫃子', N'6抽, 白色', N'140x72 公分', 2200, 22, N'Cabinet3_before.png', N'Cabinet3_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (8, N'附櫃腳收納櫃組合', N'櫃子', N'胡桃木紋', N'105x35x107 公分', 3600, 9, N'Cabinet4_before.png', N'Cabinet4_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (9, N'圓桌', N'桌子', N'白色', N'103 公分', 2800, 21, N'Desk1_before.png', N'Desk1_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (10, N'桌子附2個椅凳', N'桌子', N'黑色', N'105 公分', 4800, 4, N'Desk2_before.png', N'Desk2_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (11, N'桌子附掛勾', N'桌子', N'白色/碳黑色', N'80x80 公分', 3200, 14, N'Desk3_before.png', N'Desk3_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (12, N'長桌', N'桌子', N'棕色/米色', N'140x70x105 公分', 5400, 4, N'Desk4_before.png', N'Desk4_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (13, N'雙人座沙發', N'沙發', N'kilanda 淺米色', N'88 公分', 8800, 8, N'Sofa1_before.png', N'Sofa1_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (14, N'三人座沙發', N'沙發', N'knisa 淺灰色', N'108 公分', 10800, 2, N'Sofa2_before.png', N'Sofa2_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (15, N'雙人座沙發床', N'沙發', N'gunnared 米色', N'94 公分', 12000, 9, N'Sofa3_before.png', N'Sofa3_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (16, N'三人座沙發附躺椅', N'沙發', N'gunnared 米色', N'120 公分', 15000, 9, N'Sofa4_before.png', N'Sofa4_after.png')
INSERT [dbo].[products] ([id], [name], [sort], [introduce], [size], [price], [counts], [pic_before], [pic_after]) VALUES (28, N'高床框附2收納盒', N'床', N'染白橡木/luröy', N'150x200 公分', 8800, 9, N'2411015940.png', N'2411013821.png')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__member__EA162E1175A8C90A]    Script Date: 2024/11/14 下午 02:13:49 ******/
ALTER TABLE [dbo].[member] ADD UNIQUE NONCLUSTERED 
(
	[account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customer_service] ADD  DEFAULT (getdate()) FOR [times]
GO
ALTER TABLE [dbo].[customer_service] ADD  DEFAULT ('待回覆') FOR [status]
GO
ALTER TABLE [dbo].[member] ADD  DEFAULT ('customer') FOR [role]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [orderdate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('審核中') FOR [orderstatus]
GO
USE [master]
GO
ALTER DATABASE [mydata] SET  READ_WRITE 
GO
