USE [master]
GO
/****** Object:  Database [ServiceDB]    Script Date: 7/14/2021 10:26:20 PM ******/
CREATE DATABASE [ServiceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServiceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ServiceDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ServiceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ServiceDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ServiceDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServiceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ServiceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ServiceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ServiceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ServiceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ServiceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ServiceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ServiceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ServiceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ServiceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ServiceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ServiceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ServiceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ServiceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ServiceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ServiceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ServiceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ServiceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ServiceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ServiceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ServiceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ServiceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ServiceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ServiceDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ServiceDB] SET  MULTI_USER 
GO
ALTER DATABASE [ServiceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ServiceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ServiceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ServiceDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ServiceDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ServiceDB]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingID] [varchar](50) NOT NULL,
	[userID] [varchar](50) NULL,
	[bookingStatus] [nchar](10) NULL,
	[requestDate] [date] NULL,
	[payDate] [date] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[bookingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[deviceID] [int] NULL,
	[deviceName] [varchar](50) NULL,
	[deviceColor] [varchar](20) NULL,
	[bookingQuantity] [int] NULL,
	[bookingID] [varchar](50) NULL,
	[deviceCategory] [varchar](50) NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[bookingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [varchar](50) NOT NULL,
	[categoryName] [varchar](50) NULL,
	[categoryStatus] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Device]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Device](
	[deviceID] [int] NOT NULL,
	[deviceName] [varchar](50) NULL,
	[deviceColor] [varchar](20) NULL,
	[deviceQuantity] [int] NULL,
	[deviceCategoryID] [varchar](50) NULL,
	[deviceStatus] [nvarchar](50) NULL,
	[deviceLevel] [varchar](50) NULL,
	[deviceDateCreate] [date] NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[deviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [varchar](50) NOT NULL,
	[roleName] [varchar](50) NULL,
	[roleStatus] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/14/2021 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[phone] [varchar](20) NULL,
	[address] [nvarchar](150) NULL,
	[createDate] [datetime] NULL,
	[status] [varchar](20) NULL,
	[roleID] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1621528517590-1758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-20' AS Date), CAST(N'2021-05-25' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1621533625373-1758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-21' AS Date), CAST(N'2021-05-26' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16215341443471758289548', N'thaipro123tv@gmail.com', N'Accept    ', CAST(N'2021-05-21' AS Date), CAST(N'2021-05-26' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16215749281841758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-21' AS Date), CAST(N'2021-05-26' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1621579478852323494887', N'hamyngan.tv2016@gmail.com', N'Accept    ', CAST(N'2021-05-21' AS Date), CAST(N'2021-05-26' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16215796362641758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-21' AS Date), CAST(N'2021-05-26' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1621579971311323494887', N'hamyngan.tv2016@gmail.com', N'Done      ', CAST(N'2021-05-23' AS Date), CAST(N'2021-05-30' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16221026251621758289548', N'thaipro123tv@gmail.com', N'Done      ', CAST(N'2021-05-27' AS Date), CAST(N'2021-06-01' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16221867471821758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-28' AS Date), CAST(N'2021-06-02' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622261943774323494887', N'hamyngan.tv2016@gmail.com', N'Accept    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622263154554323494887', N'hamyngan.tv2016@gmail.com', N'Delete    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622263481877323494887', N'hamyngan.tv2016@gmail.com', N'Accept    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622263794195323494887', N'hamyngan.tv2016@gmail.com', N'Delete    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622263911788379350777', N'thainphse141140@fpt.edu.vn', N'Delete    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622264093709379350777', N'thainphse141140@fpt.edu.vn', N'Done      ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622264108195379350777', N'thainphse141140@fpt.edu.vn', N'Accept    ', CAST(N'2021-05-29' AS Date), CAST(N'2021-06-03' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622365758051379350777', N'thainphse141140@fpt.edu.vn', N'Accept    ', CAST(N'2021-07-02' AS Date), CAST(N'2021-06-04' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1622366202559379350777', N'thainphse141140@fpt.edu.vn', N'Delete    ', CAST(N'2021-05-30' AS Date), CAST(N'2021-06-04' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'16228808086881758289548', N'thaipro123tv@gmail.com', N'New       ', CAST(N'2021-06-05' AS Date), CAST(N'2021-06-10' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1775869730966236546', N'thaipro123tv@gmail.com', N'Done      ', CAST(N'2021-05-01' AS Date), CAST(N'2021-05-25' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1780019757966236546', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-15' AS Date), CAST(N'2021-06-19' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'1802416876966236546', N'thaipro123tv@gmail.com', N'Done      ', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-19' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'2038109003966236546', N'hoangthai22tv@gmail.com', N'Accept    ', CAST(N'2021-05-18' AS Date), CAST(N'2021-06-04' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'2117369356-323494887', N'hamyngan.tv2016@gmail.com', N'Delete    ', CAST(N'2021-05-18' AS Date), CAST(N'2021-05-23' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'2124630150-1758289548', N'hoangthai22tv@gmail.com', N'Delete    ', CAST(N'2021-05-18' AS Date), CAST(N'2021-05-23' AS Date))
INSERT [dbo].[Booking] ([bookingID], [userID], [bookingStatus], [requestDate], [payDate]) VALUES (N'2124745542-1758289548', N'thaipro123tv@gmail.com', N'Delete    ', CAST(N'2021-05-18' AS Date), CAST(N'2021-05-23' AS Date))
SET IDENTITY_INSERT [dbo].[BookingDetails] ON 

INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1, 12, N'Fan', N'Blue', 5, N'1775869730966236546', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (2, 6, N'Laptop', N'Black', 4, N'1775869730966236546', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (3, 3, N'Chair', N'White', 1, N'1780019757966236546', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (4, 8, N'Computer Mouse', N'Gray', 1, N'1780019757966236546', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (7, 3, N'Chair', N'White', 10, N'1802416876966236546', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (8, 9, N'Room 001', N'None', 1, N'1802416876966236546', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (9, 1, N'Tivi', N'Black', 5, N'1802416876966236546', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1007, 3, N'Chair', N'White', 1, N'2038109003966236546', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1008, 8, N'Computer Mouse', N'Gray', 10, N'2038109003966236546', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1009, 21, N'Bluetooth Speaker', N'Black', 3, N'2117369356-323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1010, 39, N'Chair', N'White', 2, N'2117369356-323494887', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1011, 40, N'Chair', N'White', 5, N'2117369356-323494887', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1012, 41, N'Chair', N'White', 10, N'2117369356-323494887', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1013, 3, N'Chair', N'White', 1, N'2117369356-323494887', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1014, 19, N'Computer', N'Black', 7, N'2117369356-323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1015, 1, N'Tivi', N'Black', 1, N'2117369356-323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1016, 5, N'USB', N'Black', 10, N'2117369356-323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1017, 21, N'Bluetooth Speaker', N'Black', 5, N'2124630150-1758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1018, 39, N'Chair', N'White', 2, N'2124630150-1758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1019, 41, N'Chair', N'White', 1, N'2124745542-1758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1020, 3, N'Chair', N'White', 1, N'2124745542-1758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1021, 19, N'Computer', N'Black', 1, N'2124745542-1758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1022, 16, N'Room 202', N'None', 1, N'1621528517590-1758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1023, 34, N'Room 205', N'None', 1, N'1621528517590-1758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1024, 37, N'Room 303', N'None', 1, N'1621528517590-1758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1025, 13, N'Room 101', N'None', 1, N'1621528517590-1758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1026, 19, N'Computer', N'Black', 2, N'1621533625373-1758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1027, 40, N'Chair', N'White', 3, N'1621533625373-1758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1028, 41, N'Chair', N'White', 4, N'1621533625373-1758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1029, 16, N'Room 202', N'None', 1, N'16215341443471758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1030, 24, N'Power Outlet', N'White', 1, N'16215341443471758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1031, 26, N'Laptop 3', N'Black', 1, N'16215341443471758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1032, 21, N'Bluetooth Speaker', N'Black', 10, N'16215749281841758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1033, 23, N'Keyboard', N'White', 10, N'16215749281841758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1034, 19, N'Computer', N'Black', 1, N'1621579478852323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1035, 26, N'Laptop 3', N'Black', 1, N'1621579478852323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1036, 16, N'Room 202', N'None', 1, N'16215796362641758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1037, 19, N'Computer', N'Black', 1, N'16215796362641758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1038, 26, N'Laptop 3', N'Black', 1, N'16215796362641758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1039, 19, N'Computer', N'Black', 1, N'1621579971311323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1040, 6, N'Laptop', N'Black', 1, N'1621579971311323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1041, 25, N'Laptop 2', N'Black', 1, N'1621579971311323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1042, 26, N'Laptop 3', N'Black', 1, N'1621579971311323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1043, 19, N'Computer', N'Black', 17, N'16221026251621758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1044, 28, N'Computer 2', N'Black', 12, N'16221026251621758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1045, 16, N'Room 202', N'None', 1, N'16221867471821758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1046, 3, N'Chair', N'White', 1, N'16221867471821758289548', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1047, 21, N'Bluetooth Speaker', N'Black', 3, N'16221867471821758289548', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1048, 6, N'Laptop', N'Black', 4, N'1622261943774323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1051, 27, N'Laptop 4', N'Black', 1, N'1622263154554323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1052, 26, N'Laptop 3', N'Black', 1, N'1622263481877323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1053, 23, N'Keyboard', N'White', 12, N'1622263794195323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1054, 12, N'Fan', N'Blue', 4, N'1622263794195323494887', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1055, 5, N'USB', N'Black', 1, N'1622263911788379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1056, 25, N'Laptop 2', N'Black', 1, N'1622263911788379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1057, 26, N'Laptop 3', N'Black', 1, N'1622263911788379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1058, 27, N'Laptop 4', N'Black', 1, N'1622263911788379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1059, 1, N'Tivi', N'Black', 1, N'1622264093709379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1060, 2, N'Table', N'White', 1, N'1622264093709379350777', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1061, 28, N'Computer 2', N'Black', 1, N'1622264093709379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1062, 3, N'Chair', N'White', 19, N'1622264108195379350777', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1063, 19, N'Computer', N'Black', 11, N'1622264108195379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1064, 41, N'Chair', N'White', 15, N'1622264108195379350777', N'Wooden')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1067, 11, N'Room 004', N'None', 1, N'1622365758051379350777', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1068, 20, N'Lamp', N'Blue', 1, N'1622366202559379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1069, 25, N'Laptop 2', N'Black', 1, N'1622366202559379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1070, 26, N'Laptop 3', N'Black', 1, N'1622366202559379350777', N'Electronic')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1071, 16, N'Room 202', N'None', 1, N'16228808086881758289548', N'Room')
INSERT [dbo].[BookingDetails] ([bookingDetailID], [deviceID], [deviceName], [deviceColor], [bookingQuantity], [bookingID], [deviceCategory]) VALUES (1072, 13, N'Room 101', N'None', 1, N'16228808086881758289548', N'Room')
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
INSERT [dbo].[Category] ([categoryID], [categoryName], [categoryStatus]) VALUES (N'EL', N'Electronic', N'Active')
INSERT [dbo].[Category] ([categoryID], [categoryName], [categoryStatus]) VALUES (N'RO', N'Room', N'Active')
INSERT [dbo].[Category] ([categoryID], [categoryName], [categoryStatus]) VALUES (N'WO', N'Wooden', N'Active')
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (1, N'Tivi', N'Black', 11, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (2, N'Table', N'White', 20, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (3, N'Chair', N'White', 2, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (4, N'Projectors', N'White', 5, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (5, N'USB', N'Black', 30, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (6, N'Laptop', N'Black', 0, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (7, N'Computer Screen', N'Black', 10, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (8, N'Computer Mouse', N'Gray', 20, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (9, N'Room 001', N'None', 1, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (10, N'Room 003 ', N'None', 0, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (11, N'Room 004', N'None', 0, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (12, N'Fan', N'Blue', 5, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (13, N'Room 101', N'None', 0, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (14, N'Room 102', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (15, N'Room 201', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (16, N'Room 202', N'None', 0, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (17, N'Room 203', N'None', 1, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (18, N'Printer', N'White', 10, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (19, N'Computer', N'Black', 14, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (20, N'Lamp', N'Blue', 20, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (21, N'Bluetooth Speaker', N'Black', 23, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (22, N'Desk', N'Black', 30, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (23, N'Keyboard', N'White', 15, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (24, N'Power Outlet', N'White', 20, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (25, N'Laptop 2', N'Black', 15, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (26, N'Laptop 3', N'Black', 13, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (27, N'Laptop 4', N'Black', 25, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (28, N'Computer 2', N'Black', 20, N'EL', N'Active', N'Lv1', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (29, N'Computer 3', N'Black', 10, N'EL', N'Active', N'Lv2', CAST(N'2021-05-15' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (30, N'Desk 2', N'Black', 30, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (31, N'Desk 3', N'White', 25, N'WO', N'Active', N'Lv2', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (32, N'Desk 4', N'White', 15, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (33, N'Room 204', N'None', 1, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (34, N'Room 205', N'None', 1, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (35, N'Room 301', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (36, N'Room 302', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (37, N'Room 303', N'None', 2, N'RO', N'Active', N'Lv1', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (38, N'Room 304', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-20' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (39, N'Chair', N'White', 22, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (40, N'Chair', N'White', 31, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (41, N'Chair', N'White', 28, N'WO', N'Active', N'Lv1', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (42, N'Room 401', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-10' AS Date))
INSERT [dbo].[Device] ([deviceID], [deviceName], [deviceColor], [deviceQuantity], [deviceCategoryID], [deviceStatus], [deviceLevel], [deviceDateCreate]) VALUES (43, N'Room 402', N'None', 1, N'RO', N'Active', N'Lv2', CAST(N'2021-05-18' AS Date))
INSERT [dbo].[Role] ([roleID], [roleName], [roleStatus]) VALUES (N'EM', N'Employees', N'Active')
INSERT [dbo].[Role] ([roleID], [roleName], [roleStatus]) VALUES (N'LE', N'Leaders', N'Active')
INSERT [dbo].[Role] ([roleID], [roleName], [roleStatus]) VALUES (N'MA', N'Manager', N'Active')
INSERT [dbo].[User] ([userID], [password], [fullName], [phone], [address], [createDate], [status], [roleID]) VALUES (N'hamyngan.tv2016@gmail.com', N'123456', N'Mỹ Ngân', N'0584324728', N'Châu Thành', CAST(N'2021-05-15 21:40:32.747' AS DateTime), N'Active', N'LE')
INSERT [dbo].[User] ([userID], [password], [fullName], [phone], [address], [createDate], [status], [roleID]) VALUES (N'hoangthai22tv@gmail.com', N'123456', N'Nguyễn Phạm Hoàng Thái', N'0353270383', N'Quận 9, TP HCM', CAST(N'2021-05-12 00:00:00.000' AS DateTime), N'Active', N'MA')
INSERT [dbo].[User] ([userID], [password], [fullName], [phone], [address], [createDate], [status], [roleID]) VALUES (N'thainphse141140@fpt.edu.vn', N'123456', N'Nguyen Thai', N'0353270383', N'290A, Nguyen thi minh khai', CAST(N'2021-05-26 21:42:56.770' AS DateTime), N'Active', N'LE')
INSERT [dbo].[User] ([userID], [password], [fullName], [phone], [address], [createDate], [status], [roleID]) VALUES (N'thaipro123tv@gmail.com', N'123456', N'Hoang Thai', N'0353270383', N'Trà Vinh', CAST(N'2021-05-15 21:40:32.747' AS DateTime), N'Active', N'EM')
INSERT [dbo].[User] ([userID], [password], [fullName], [phone], [address], [createDate], [status], [roleID]) VALUES (N'thunguyen3415vn@gmail.com', N'123456', N'Hoang Thai', N'0353270383', N'290A, Nguyen thi minh khai', CAST(N'2021-05-30 15:24:06.027' AS DateTime), N'New', N'LE')
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Booking] FOREIGN KEY([bookingID])
REFERENCES [dbo].[Booking] ([bookingID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Booking]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Device] FOREIGN KEY([deviceID])
REFERENCES [dbo].[Device] ([deviceID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Device]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Category] FOREIGN KEY([deviceCategoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ServiceDB] SET  READ_WRITE 
GO
