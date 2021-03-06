USE [master]
GO
/****** Object:  Database [LinlangMall]    Script Date: 2020/7/9 14:17:28 ******/
CREATE DATABASE [LinlangMall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LinlangMall_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LinlangMall_data.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LinlangMall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LinlangMall_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LinlangMall] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LinlangMall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LinlangMall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LinlangMall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LinlangMall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LinlangMall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LinlangMall] SET ARITHABORT OFF 
GO
ALTER DATABASE [LinlangMall] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LinlangMall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LinlangMall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LinlangMall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LinlangMall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LinlangMall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LinlangMall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LinlangMall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LinlangMall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LinlangMall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LinlangMall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LinlangMall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LinlangMall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LinlangMall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LinlangMall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LinlangMall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LinlangMall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LinlangMall] SET RECOVERY FULL 
GO
ALTER DATABASE [LinlangMall] SET  MULTI_USER 
GO
ALTER DATABASE [LinlangMall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LinlangMall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LinlangMall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LinlangMall] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LinlangMall] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LinlangMall] SET QUERY_STORE = OFF
GO
USE [LinlangMall]
GO
/****** Object:  UserDefinedFunction [dbo].[F_strToTable]    Script Date: 2020/7/9 14:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[F_strToTable]
(
	@str varchar(1000)
)
Returns @splitTable Table
(
   value varchar(50)
)
As
--该函数用于把一个用逗号分隔的多个数据字符串变成一个表的一列，例如字符串'1,2,3,4,5' 将编程一个表，这个表
Begin
set @str = @str+','
Declare @insertStr varchar(50) --截取后的第一个字符串
Declare @newstr varchar(1000) --截取第一个字符串后剩余的字符串
set @insertStr = left(@str,charindex(',',@str)-1)
set @newstr = stuff(@str,1,charindex(',',@str),'')
Insert @splitTable Values(@insertStr)
while(len(@newstr)>0)
begin
   set @insertStr = left(@newstr,charindex(',',@newstr)-1)
   Insert @splitTable Values(@insertStr)
   set @newstr = stuff(@newstr,1,charindex(',',@newstr),'')
end
Return
End
GO
/****** Object:  Table [dbo].[M_Comment]    Script Date: 2020/7/9 14:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReplyToId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Content] [varchar](1000) NOT NULL,
	[UserId] [int] NULL,
	[EmployeeId] [int] NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_M_COMMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_Employee]    Script Date: 2020/7/9 14:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Gender] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[LoginId] [varchar](20) NOT NULL,
	[LoginPWD] [varchar](50) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[IsSuper] [bit] NOT NULL,
 CONSTRAINT [PK_M_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_Inventory]    Script Date: 2020/7/9 14:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[InventoryAction] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[OrderId] [int] NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_INVENTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_Order]    Script Date: 2020/7/9 14:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[UserAddressId] [int] NULL,
	[Status] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[Remark] [varchar](250) NULL,
 CONSTRAINT [PK_M_ORDER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_OrderDetail]    Script Date: 2020/7/9 14:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Count] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_M_ORDERDETAIL] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_Product]    Script Date: 2020/7/9 14:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Summary] [varchar](250) NOT NULL,
	[Price] [money] NOT NULL,
	[Picture] [varchar](125) NOT NULL,
	[OnSale] [bit] NOT NULL,
	[Description] [varchar](1000) NULL,
	[ActualStock] [int] NOT NULL,
	[AvailableStock] [int] NOT NULL,
	[HoldingStock] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_M_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_ProductCategory]    Script Date: 2020/7/9 14:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](30) NOT NULL,
	[Summary] [varchar](60) NULL,
	[Remark] [varchar](250) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
	[ParentId] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[isRecommend] [bit] NOT NULL,
 CONSTRAINT [PK_M_PRODUCTCATEGORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_ShoppingCart]    Script Date: 2020/7/9 14:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_ShoppingCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_M_SHOPPINGCART] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_User]    Script Date: 2020/7/9 14:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NickName] [varchar](20) NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [date] NULL,
	[Balance] [money] NOT NULL,
	[LoginId] [varchar](20) NOT NULL,
	[LoginPWD] [varchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_M_USER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_UserAddress]    Script Date: 2020/7/9 14:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_UserAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[IsDefault] [bit] NULL,
	[CreatedTime] [datetime] NOT NULL,
	[ModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_M_USERADDRESS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M_WalletBilling]    Script Date: 2020/7/9 14:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_WalletBilling](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BillingType] [int] NOT NULL,
	[Billing] [money] NOT NULL,
	[OrderId] [int] NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_M_WALLETBILLING] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[M_Employee] ON 

INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1, N'admin', 0, N'', N'admin', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-13T11:24:56.253' AS DateTime), CAST(N'2020-05-13T11:24:56.253' AS DateTime), NULL, 1)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2, N'单升文', 1, N'DWADAADA', N'ssw', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-27T15:55:04.977' AS DateTime), CAST(N'2020-06-29T16:55:58.463' AS DateTime), N'1123@QQ.COM', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (3, N'张三', 2, N'13112345678', N'zhangsan', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-27T16:12:04.240' AS DateTime), CAST(N'2020-05-27T17:35:44.000' AS DateTime), NULL, 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1002, N'李四', 2, N'', N'lisi', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T09:34:25.373' AS DateTime), CAST(N'2020-05-28T09:42:28.277' AS DateTime), NULL, 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1003, N'王五', 0, N'', N'wangwu', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:09:50.287' AS DateTime), CAST(N'2020-05-28T14:09:50.287' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1004, N'赵六', 0, N'13343215676', N'zhaoliu', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:10:24.340' AS DateTime), CAST(N'2020-05-29T09:27:36.990' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1005, N'孙七', 0, N'', N'sunqi', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:11:59.530' AS DateTime), CAST(N'2020-05-28T14:11:59.530' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1006, N'周八', 0, N'', N'zhouba', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:13:19.393' AS DateTime), CAST(N'2020-05-28T14:13:19.393' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1007, N'吴九', 0, N'', N'wujiu', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:13:55.680' AS DateTime), CAST(N'2020-05-28T14:13:55.680' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1008, N'刘一', 0, N'', N'liuyi', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:19:21.270' AS DateTime), CAST(N'2020-05-28T14:19:21.270' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1009, N'陈二', 0, N'', N'chener', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:19:44.300' AS DateTime), CAST(N'2020-05-28T14:19:44.300' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (1010, N'郑十', 1, N'', N'zhengshi', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-28T14:40:26.580' AS DateTime), CAST(N'2020-05-28T14:40:26.580' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2002, N'钱十一', 1, N'', N'qianshiyi', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-05-29T09:26:33.560' AS DateTime), CAST(N'2020-05-29T09:26:33.560' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2003, N'刘鹤轩', 1, N'', N'liuhexuan', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T09:40:39.547' AS DateTime), CAST(N'2020-06-29T10:03:14.730' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2004, N'张展', 1, N'1111', N'111111', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T09:46:28.010' AS DateTime), CAST(N'2020-06-29T09:46:28.010' AS DateTime), N'1111', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2005, N'芜湖大司马', 0, N'第五层', N'666666', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T09:47:23.843' AS DateTime), CAST(N'2020-06-29T09:47:23.843' AS DateTime), N'起飞', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2006, N'鱼仔', 0, N'18570935555', N'654656', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T14:49:22.870' AS DateTime), CAST(N'2020-06-29T14:49:22.870' AS DateTime), N'1156', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2007, N'谢鹏飞', 2, N'1392977', N'123456', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T15:45:22.620' AS DateTime), CAST(N'2020-06-29T16:22:35.450' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2008, N'贺梓龙', 0, N'17336671720', N'ayayay666', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T16:14:29.447' AS DateTime), CAST(N'2020-06-29T16:15:47.067' AS DateTime), N'2054267858@qq.com', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2009, N'李天育', 2, N'17726121159', N'1234562', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T16:16:19.043' AS DateTime), CAST(N'2020-06-29T16:21:41.353' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2010, N'李天育', 0, N'17726121159', N'111111111111111', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T16:17:19.603' AS DateTime), CAST(N'2020-06-29T16:17:19.603' AS DateTime), N'', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2011, N'阿鹏', 1, N'110', N'Superadministrator', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T16:21:19.587' AS DateTime), CAST(N'2020-06-29T16:21:19.587' AS DateTime), N'99999@qq.com', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2012, N'胡亚林', 2, N'383838', N'777777777777', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2020-06-29T16:22:05.917' AS DateTime), CAST(N'2020-06-29T16:57:18.243' AS DateTime), N'250250250', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2013, N'打法', 1, N'大', N'345', N'3453', 0, CAST(N'2020-06-30T19:26:37.717' AS DateTime), CAST(N'2020-06-30T19:26:37.717' AS DateTime), N'345453@54', 0)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2014, N'撒地方', 0, N'3451', N'2341', N'214', 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2020-02-03T00:00:00.000' AS DateTime), N'dsfa', 1)
INSERT [dbo].[M_Employee] ([Id], [Name], [Gender], [PhoneNumber], [LoginId], [LoginPWD], [Disabled], [CreatedTime], [ModifiedTime], [Email], [IsSuper]) VALUES (2016, N'打法', 0, N'12341', N'dd', N'123', 0, CAST(N'2020-07-06T01:12:05.897' AS DateTime), CAST(N'2020-07-06T01:12:05.897' AS DateTime), N'123@qq.com', 1)
SET IDENTITY_INSERT [dbo].[M_Employee] OFF
SET IDENTITY_INSERT [dbo].[M_Order] ON 

INSERT [dbo].[M_Order] ([Id], [Code], [UserId], [Amount], [UserAddressId], [Status], [CreatedTime], [ModifiedTime], [Remark]) VALUES (1, N'200616163312', 1, 40.0000, 0, 1, CAST(N'2020-06-16T16:33:12.977' AS DateTime), CAST(N'2020-06-18T11:28:13.720' AS DateTime), N'')
INSERT [dbo].[M_Order] ([Id], [Code], [UserId], [Amount], [UserAddressId], [Status], [CreatedTime], [ModifiedTime], [Remark]) VALUES (2, N'2006189282', 1, 306.0000, 0, 5, CAST(N'2020-06-18T09:28:02.107' AS DateTime), CAST(N'2020-06-22T08:53:52.340' AS DateTime), N'')
INSERT [dbo].[M_Order] ([Id], [Code], [UserId], [Amount], [UserAddressId], [Status], [CreatedTime], [ModifiedTime], [Remark]) VALUES (3, N'20062011553', 1, 18.0000, 0, 1, CAST(N'2020-06-20T11:55:03.373' AS DateTime), CAST(N'2020-06-20T11:55:05.450' AS DateTime), N'')
INSERT [dbo].[M_Order] ([Id], [Code], [UserId], [Amount], [UserAddressId], [Status], [CreatedTime], [ModifiedTime], [Remark]) VALUES (4, N'20062285337', 1, 117.6000, 0, 1, CAST(N'2020-06-22T08:53:37.497' AS DateTime), CAST(N'2020-06-22T08:53:40.980' AS DateTime), N'')
INSERT [dbo].[M_Order] ([Id], [Code], [UserId], [Amount], [UserAddressId], [Status], [CreatedTime], [ModifiedTime], [Remark]) VALUES (5, N'20062417236', 1, 46.8000, 0, 1, CAST(N'2020-06-24T17:02:36.127' AS DateTime), CAST(N'2020-06-24T17:02:40.370' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[M_Order] OFF
SET IDENTITY_INSERT [dbo].[M_OrderDetail] ON 

INSERT [dbo].[M_OrderDetail] ([Id], [OrderId], [ProductId], [Price], [Count], [Amount], [CreatedTime], [ModifiedTime]) VALUES (1, 1, 2, 20.0000, 2, 40.0000, CAST(N'2020-06-16T16:33:12.977' AS DateTime), CAST(N'2020-06-16T16:33:12.977' AS DateTime))
INSERT [dbo].[M_OrderDetail] ([Id], [OrderId], [ProductId], [Price], [Count], [Amount], [CreatedTime], [ModifiedTime]) VALUES (2, 2, 1, 18.0000, 17, 306.0000, CAST(N'2020-06-18T09:28:02.107' AS DateTime), CAST(N'2020-06-18T09:28:02.107' AS DateTime))
INSERT [dbo].[M_OrderDetail] ([Id], [OrderId], [ProductId], [Price], [Count], [Amount], [CreatedTime], [ModifiedTime]) VALUES (3, 3, 1, 18.0000, 1, 18.0000, CAST(N'2020-06-20T11:55:03.373' AS DateTime), CAST(N'2020-06-20T11:55:03.373' AS DateTime))
INSERT [dbo].[M_OrderDetail] ([Id], [OrderId], [ProductId], [Price], [Count], [Amount], [CreatedTime], [ModifiedTime]) VALUES (4, 4, 4, 58.8000, 2, 117.6000, CAST(N'2020-06-22T08:53:37.497' AS DateTime), CAST(N'2020-06-22T08:53:37.497' AS DateTime))
INSERT [dbo].[M_OrderDetail] ([Id], [OrderId], [ProductId], [Price], [Count], [Amount], [CreatedTime], [ModifiedTime]) VALUES (5, 5, 5, 46.8000, 1, 46.8000, CAST(N'2020-06-24T17:02:36.127' AS DateTime), CAST(N'2020-06-24T17:02:36.127' AS DateTime))
SET IDENTITY_INSERT [dbo].[M_OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[M_Product] ON 

INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (1, 5, 7, N'飘柔', N'', 18.0000, N'c7b63547-6a9b-4c67-bce1-3f0514e9f0f4.jpg', 1, NULL, 0, 0, 0, 0, CAST(N'2020-06-02T14:31:31.647' AS DateTime), CAST(N'2020-06-02T14:31:31.647' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (2, 5, 7, N'海飞丝', N'', 20.0000, N'3216cb38-df21-485d-95c4-282bf90faf69.jpg', 1, NULL, 0, 0, 0, 0, CAST(N'2020-06-02T14:41:28.510' AS DateTime), CAST(N'2020-06-02T14:41:28.510' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (3, 5, 6, N'多芬', N'', 28.9000, N'6d05f0db-9c31-4ce6-983c-7213956ce733.jpg', 0, N'', 0, 0, 0, 0, CAST(N'2020-06-18T11:42:20.140' AS DateTime), CAST(N'2020-06-18T11:42:20.140' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (4, 4, 1006, N'南极人床上四件套', N'', 58.8000, N'62c5dd58-b4f5-4f32-ace6-067fb3f7213c.jpg', 1, N'', 0, 0, 0, 0, CAST(N'2020-06-18T14:08:07.480' AS DateTime), CAST(N'2020-06-18T14:08:07.480' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (5, 3, 2, N'迪士尼儿童训练用筷，含汤匙4件套', N'', 46.8000, N'420a11a3-e75f-4093-a2ee-ed176c28cbf8.jpg', 1, N'', 0, 0, 0, 0, CAST(N'2020-06-18T14:11:20.740' AS DateTime), CAST(N'2020-06-18T14:11:20.740' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (6, 3, 1, N'九阳刀具，刀具六件套', N'', 89.8000, N'f3e3cf70-25eb-4fd2-804e-4af8738185cc.jpg', 1, N'', 0, 0, 0, 0, CAST(N'2020-06-18T14:13:41.910' AS DateTime), CAST(N'2020-06-18T14:13:41.910' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (7, 4, 1005, N'1', N'1', 1.0000, N'', 1, N'1', 0, 0, 0, 0, CAST(N'2020-06-29T11:36:47.700' AS DateTime), CAST(N'2020-06-29T11:36:47.700' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (14, 3, 1, N'打法', N'kkkkkk', 123.0000, N'5.jfif', 0, N'null', 15, 10, 5, 0, CAST(N'2020-07-06T01:28:54.510' AS DateTime), CAST(N'2020-07-06T01:28:54.510' AS DateTime))
INSERT [dbo].[M_Product] ([Id], [CategoryId], [SubCategoryId], [Name], [Summary], [Price], [Picture], [OnSale], [Description], [ActualStock], [AvailableStock], [HoldingStock], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (15, 3, 1, N'打法', N'kkkkkk', 123.0000, N'5.jfif', 0, N'null', 15, 10, 5, 0, CAST(N'2020-07-06T01:31:12.717' AS DateTime), CAST(N'2020-07-06T01:31:12.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[M_Product] OFF
SET IDENTITY_INSERT [dbo].[M_ProductCategory] ON 

INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1, N'厨具', N'厨具', N'做饭用的发生大法师', CAST(N'2020-05-13T18:01:35.547' AS DateTime), CAST(N'2020-07-09T11:19:32.117' AS DateTime), 3, 1, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (2, N'餐具', N'碗勺筷', N'', CAST(N'2020-05-14T09:25:22.077' AS DateTime), CAST(N'2020-05-14T09:25:22.077' AS DateTime), 3, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (3, N'厨房', N'', N'', CAST(N'2020-05-28T16:59:35.383' AS DateTime), CAST(N'2020-05-28T16:59:35.383' AS DateTime), 0, 1, 0)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (4, N'床上用品', N'', N'', CAST(N'2020-05-28T17:01:14.170' AS DateTime), CAST(N'2020-05-28T17:01:14.170' AS DateTime), 0, 0, 0)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (5, N'洗浴用品', N'', N'', CAST(N'2020-05-28T17:02:48.030' AS DateTime), CAST(N'2020-05-28T17:02:48.030' AS DateTime), 0, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (6, N'沐浴露', N'沐浴露', N'', CAST(N'2020-05-28T17:19:22.300' AS DateTime), CAST(N'2020-07-09T12:08:07.430' AS DateTime), 5, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (7, N'洗发水', N'', N'', CAST(N'2020-05-28T17:20:41.130' AS DateTime), CAST(N'2020-05-28T17:20:41.130' AS DateTime), 5, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1003, N'被单', N'', N'', CAST(N'2020-06-18T14:06:17.830' AS DateTime), CAST(N'2020-06-18T14:06:17.830' AS DateTime), 4, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1004, N'枕头', N'', N'', CAST(N'2020-06-18T14:06:28.757' AS DateTime), CAST(N'2020-06-18T14:06:28.757' AS DateTime), 4, 0, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1005, N'被套', N'', N'', CAST(N'2020-06-18T14:06:39.257' AS DateTime), CAST(N'2020-06-18T14:06:39.257' AS DateTime), 4, 1, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1006, N'四件套', N'', N'15:41', CAST(N'2020-06-18T14:06:53.550' AS DateTime), CAST(N'2020-06-18T14:06:53.550' AS DateTime), 4, 1, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1007, N'撒地方', N'飞洒地方', N'发士大夫', CAST(N'2020-06-30T12:31:44.587' AS DateTime), CAST(N'2020-06-30T12:31:44.587' AS DateTime), 1, 1, 1)
INSERT [dbo].[M_ProductCategory] ([Id], [Category], [Summary], [Remark], [CreatedTime], [ModifiedTime], [ParentId], [deleted], [isRecommend]) VALUES (1008, N'撒地方', N'士大夫', N'士大夫', CAST(N'2020-07-09T12:13:29.057' AS DateTime), CAST(N'2020-07-09T12:13:29.057' AS DateTime), 1, 0, 0)
SET IDENTITY_INSERT [dbo].[M_ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[M_ShoppingCart] ON 

INSERT [dbo].[M_ShoppingCart] ([Id], [UserId], [ProductId], [Count], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (1, 1, 1, 17, 1, CAST(N'2020-06-09T17:25:11.510' AS DateTime), CAST(N'2020-06-15T11:57:51.410' AS DateTime))
INSERT [dbo].[M_ShoppingCart] ([Id], [UserId], [ProductId], [Count], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (2, 1, 2, 2, 1, CAST(N'2020-06-10T16:05:00.903' AS DateTime), CAST(N'2020-06-11T15:43:42.997' AS DateTime))
INSERT [dbo].[M_ShoppingCart] ([Id], [UserId], [ProductId], [Count], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (4, 1, 0, 3, 0, CAST(N'2020-06-12T09:55:59.563' AS DateTime), CAST(N'2020-06-12T09:56:19.923' AS DateTime))
INSERT [dbo].[M_ShoppingCart] ([Id], [UserId], [ProductId], [Count], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (5, 1, 4, 2, 1, CAST(N'2020-06-22T08:52:04.950' AS DateTime), CAST(N'2020-06-22T08:52:04.950' AS DateTime))
INSERT [dbo].[M_ShoppingCart] ([Id], [UserId], [ProductId], [Count], [Deleted], [CreatedTime], [ModifiedTime]) VALUES (6, 1, 5, 1, 1, CAST(N'2020-06-24T17:02:05.810' AS DateTime), CAST(N'2020-06-24T17:02:05.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[M_ShoppingCart] OFF
SET IDENTITY_INSERT [dbo].[M_User] ON 

INSERT [dbo].[M_User] ([Id], [NickName], [Gender], [Birthday], [Balance], [LoginId], [LoginPWD], [CreatedTime]) VALUES (1, NULL, 0, NULL, 0.0000, N'shanshengwen', N'cc0b044bf6d02448f2ff41b8c422be5d', CAST(N'2020-05-11T17:21:28.130' AS DateTime))
INSERT [dbo].[M_User] ([Id], [NickName], [Gender], [Birthday], [Balance], [LoginId], [LoginPWD], [CreatedTime]) VALUES (3, NULL, 0, NULL, 0.0000, N'dalao_', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2020-05-11T17:38:24.487' AS DateTime))
SET IDENTITY_INSERT [dbo].[M_User] OFF
ALTER TABLE [dbo].[M_Employee] ADD  DEFAULT ((0)) FOR [IsSuper]
GO
ALTER TABLE [dbo].[M_Product] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[M_ProductCategory] ADD  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[M_ProductCategory] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[M_ProductCategory] ADD  DEFAULT ((0)) FOR [isRecommend]
GO
/****** Object:  StoredProcedure [dbo].[PC_Employee]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PC_Employee]
(
	@name varchar(20),
	@gender int = 0,
	@email varchar(50)=null,
	@phoneNumber varchar(20) = null,
	@loginId varchar(20),
	@loginPWD varchar(50),
	@disabled bit = 0,
	@msg varchar(50) output
)
as
begin
	declare @success bit = 0
	if exists(select 1
			from	M_Employee
			where	LoginId = @loginId)
	begin
		set @msg ='已存在的用户登录Id'
		set @success = 0
	end
	else
	begin
		insert into M_Employee
		(
			[Name],
			[Gender],
			[PhoneNumber],
			[Email],
			[LoginId],
			[LoginPWD],
			[Disabled],
			[CreatedTime],
			[ModifiedTime]
		)
		values
		(
			@name,
			@gender,
			@phoneNumber,
			@email,
			@loginId,
			@loginPWD,
			@disabled,
			getdate(),
			getdate()
		)

		set @success = 1
	end	

	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PC_Employee_03]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE proc [dbo].[PC_Employee_03](
 	  @id int=null,
		@name varchar(30) =null,
		@gender int=null,
		@email varchar(50)=null ,
		@phonenumber varchar(50)=null  ,
		@loginid varchar(50)=null  ,
		@issuper bit=null,
		@disabled bit=null,
		@ispaging int=1 ,
		@pageindex int=1 ,
		@pagesize int=10,
		@records int output
 
 )
 as
 begin

 select * 
 into #filter
 from M_Employee
 where 
 
 id=isnull(@id,id)
 and gender=isnull(@gender,gender)
and email like '%'+isnull(@email,email)+'%'
and phonenumber=isnull(@phonenumber,phonenumber)
and loginid like '%'+isnull(@loginid,loginid)+'%' 
and issuper=isnull(@issuper,issuper)
and [disabled]=isnull(@disabled ,[disabled])
if(ISNULL(@ispaging,0)=0)
	begin
		select * from #filter order by id  desc
	end
	else
	begin
	select * 
	from (
	select *,ROW_NUMBER() over(order by id desc) as rowNum
	from #filter  ) as t
	where rowNum between (@pageindex-1)*@pagesize+1 
	and @pageindex*@pagesize
	select @records=COUNT(Id)from #filter

	end
 end

 select * from M_Employee
GO
/****** Object:  StoredProcedure [dbo].[PC_Order]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PC_Order]
(
    @ProductId int,
	@Count int,
    @UserId int,
	@addressId int = null,
	@remark varchar(250) = null,
	@orderId int output
)
as
begin
	declare @currentTime datetime
	declare @orderAmount decimal(18,2)

	begin try
		begin transaction
		set @currentTime = getdate()

		select	@orderAmount = price * @Count
		from	M_Product
		where	id = @ProductId

		insert into [M_Order]
		(
			Code,
			UserId,
			Amount,
			UserAddressId,
			[Status],
			CreatedTime,
			ModifiedTime,
			Remark
		)
		values
		(
			concat(CONVERT(CHAR(6), @currentTime, 12),datepart(hour,@currentTime),datepart(MINUTE,@currentTime),datepart(second,@currentTime)),
			@userId,
			@orderAmount,
			@addressId,
			0,
			@currentTime,
			@currentTime,
			@remark
		)
		set @orderId = SCOPE_IDENTITY()

		insert into M_OrderDetail
		(
			OrderId,
			ProductId,
			Price,
			[Count],
			Amount,
			CreatedTime,
			ModifiedTime
		)
		select	@orderId,
				@ProductId,
				pd.Price,
				@Count,
				pd.Price,
				@currentTime,
				@currentTime
		from	M_Product pd
		where	pd.id = @ProductId

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[PC_OrderFromCart]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PC_OrderFromCart]
(
	@cartIds varchar(1000) = null,
	@userId int,
	@addressId int = null,
	@remark varchar(250) = null,
	@OrderId int output
)
as
begin
	declare @currentTime datetime
	declare @orderAmount decimal(18,2)

	begin try
		begin transaction
		set @currentTime = getdate()

		insert into [M_Order]
		(
			Code,
			UserId,
			Amount,
			UserAddressId,
			[Status],
			CreatedTime,
			ModifiedTime,
			Remark
		)
		values
		(
			concat(CONVERT(CHAR(6), @currentTime, 12),datepart(hour,@currentTime),datepart(MINUTE,@currentTime),datepart(second,@currentTime)),
			@userId,
			0,
			@addressId,
			0,
			@currentTime,
			@currentTime,
			@remark
		)
		set @orderId = SCOPE_IDENTITY()

		insert into M_OrderDetail
		(
			OrderId,
			ProductId,
			Price,
			[Count],
			Amount,
			CreatedTime,
			ModifiedTime
		)
		select	@orderId,
				cart.ProductId,
				pd.Price,
				cart.[Count],
				pd.Price * cart.[Count],
				@currentTime,
				@currentTime
		from	F_strToTable(@cartIds) cartIds
		join	M_ShoppingCart cart on cart.Id = cartids.value
		join	M_Product pd on pd.Id = cart.ProductId
		where	cart.Deleted = 0

		select	@orderAmount = sum(Amount)
		from	M_OrderDetail
		where	OrderId = @orderId
		group by OrderId

		update	[M_Order]
		set		Amount = @orderAmount
		where	id = @orderId

		update	M_ShoppingCart
		set		Deleted = 1
		from	M_ShoppingCart cart
		join	F_strToTable(@cartIds) cartIds on cart.Id = cartids.value

		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[PC_Product]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PC_Product]
(
	@name varchar(100),
	@categoryId int,
	@subCategoryId int,
	@Summary varchar(250) = null,
	@Price decimal(18,2),
	@Picture varchar(125) = '',
	@OnSale bit = 1,
	@Description varchar(1000) = null,
	@msg varchar(256) output
)
as
begin
	declare @success bit 
	set @success = 0

	if exists(select 1
			from	M_Product
			where	name = @name
			and		CategoryId = @categoryId
			and		SubCategoryId = @subCategoryId)
	begin
		set @success = 0
		set @msg = '同类商品中，已存在名为'+ CONVERT(varchar(100),@name) +'的商品'
		return @success
	end
	else
	begin
		INSERT INTO [dbo].[M_Product]
           ([CategoryId]
		   ,[SubCategoryId]
           ,[Name]
           ,[Summary]
           ,[Price]
           ,[Picture]
           ,[OnSale]
           ,[Description]
           ,[ActualStock]
           ,[AvailableStock]
           ,[HoldingStock]
		   ,[Deleted]
           ,[CreatedTime]
           ,[ModifiedTime])
     VALUES
           (@categoryId
		   ,@subCategoryId
           ,@name
           ,@Summary
           ,@Price
           ,@Picture
           ,@OnSale
           ,@Description
           ,0
           ,0
           ,0
		   ,0
           ,getdate()
           ,getdate())
	end

	set @success = 1
	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PC_ProductCategory]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PC_ProductCategory]
(
	@parentId int = 0,
	@category varchar(30),
	@summary varchar(60) = null,
	@remark varchar(250) = null,
	@isRecommend bit = 0,
	@msg varchar(256) output
)
as
begin
	declare @success bit
	set @success = 0

	if exists(select 1
			from	M_ProductCategory
			where	Category = @category
			and		parentId = @parentId)
	begin
		set @success = 0
		set @msg = '已存在该商品分类'
		return 
	end
	else
	begin
		insert into M_ProductCategory
		(
			[ParentId],
			[Category],
			[Summary],
			[Remark],
			[isRecommend],
			[deleted],
			[CreatedTime],
			[ModifiedTime]
		)
		values
		(
			@parentId,
			@category,
			@summary,
			@remark,
			@isRecommend,
			0,
			getdate(),
			getdate()
		)
	end

	set @success = 1
	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PC_ShoppingCart]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PC_ShoppingCart]
(
	@userId int,
	@productId int,
	@count int
)
as
begin
	declare @activeId int

	select	@activeId = id
	from	M_ShoppingCart
	where	UserId = @userId
	and		ProductId = @productId
	and		Deleted = 0

	if(@activeId is not null)
	begin
		update	M_ShoppingCart
		set		[Count] = [Count] + @count,
				ModifiedTime = GETDATE()
		where	id = @activeId
	end
	else
	begin
		insert into M_ShoppingCart(
			UserId,
			ProductId,
			[Count],
			Deleted,
			CreatedTime,
			ModifiedTime
		)
		values
		(
			@userId,
			@productId,
			@count,
			0,
			getdate(),
			getdate()
		)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PC_User]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PC_User]
(
    @NickName varchar(20) = null,
    @Gender int = 0,
    @Birthday DateTime = null,
    @Balance decimal = 0,
    @LoginId varchar(20),
    @LoginPWD varchar(50)
)
as
begin
	declare @returnValue bit
	set @returnValue = 0
	if exists(select	1 
				from	M_User
				where	LoginId = @LoginId)
	begin
		set @returnValue = 1
	end
	else
	begin
		insert into [M_User]
		(
			[NickName],
			[Gender],
			[Birthday],
			[Balance],
			[LoginId],
			[LoginPWD],
			[CreatedTime]
		)
		values(
			@NickName,
			@Gender,
			@Birthday,
			@Balance,
			@LoginId,
			@LoginPWD,
			getdate()
		)
	end
	return @returnValue
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Employee]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_Employee]
(
	@id int = null,
	@name varchar(20) = null,
	@gender int = null,
	@phoneNumber varchar(20) = null,
	@loginId varchar(20) = null,
	@loginPWD varchar(50) = null,
	@paging bit = 1,
	@pageIndex int = 1,
	@pageSize int = 10,
	@records int = 0 output 
)
as 
begin
	select	*
	into	#filterd
	from	M_Employee
	where	id = isnull(@id, id)
	and		isnull(Name,'') like '%' + convert(varchar(20),isnull(@name,'')) + '%'
	and		Gender = isnull(@gender, gender)
	and		isnull(PhoneNumber,'') like '%' + convert(varchar(20),isnull(@phoneNumber,'')) + '%'
	and		LoginId = isnull(@loginId, LoginId)
	and		LoginPWD = isnull(@loginPWD, LoginPwd)

	if(isnull(@paging, 0) = 0)
	begin
		select * 
		from	#filterd
		order by CreatedTime desc
	end
	else
	begin
		select *
		from	#filterd
		order by CreatedTime desc
		offset (@pageIndex -1)*@pageSize rows
		fetch next @pageSize rows only

		select @records = count(*) from	#filterd
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Employee_03]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_Employee_03]
(
	@id int = null,
	@name varchar(20) = null,
	@gender int = null,
	@phoneNumber varchar(20) = null,
	@loginId varchar(20) = null,
	@loginPWD varchar(50) = null,
	@paging bit = 1,
	@pageIndex int = 1,
	@pageSize int = 10,
	@records int = 0 output 
)
as 
begin
	select	*
	into	#filterd
	from	M_Employee
	where	id = isnull(@id, id)
	and		isnull(Name,'') like '%' + convert(varchar(20),isnull(@name,'')) + '%'
	and		Gender = isnull(@gender, gender)
	and		isnull(PhoneNumber,'') like '%' + convert(varchar(20),isnull(@phoneNumber,'')) + '%'
	and		LoginId = isnull(@loginId, LoginId)
	and		LoginPWD = isnull(@loginPWD, LoginPwd)

	if(isnull(@paging, 0) = 0)
	begin
		select * 
		from	#filterd
		order by CreatedTime desc
	end
	else
	begin
		select *
		from	#filterd
		order by CreatedTime desc
		offset (@pageIndex -1)*@pageSize rows
		fetch next @pageSize rows only

		select @records = count(*) from	#filterd
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Order]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_Order]
(
	@userId int = null,
	@orderId int = null,
	@orderStatus int = null,
	@paging bit = 0,
	@pageIndex int = 1,
	@pageSize int = 10,
	@records int = 0 output
)
as
begin
	select	ord.*
	into	#filtered
	from	M_Order ord
	where	ord.id = isnull(@orderId, ord.Id)
	and		ord.[Status] =  isnull(@orderStatus, ord.[Status])
	and		ord.UserId = isnull(@userId, ord.UserId)

	select	@records = count(*)
	from	#filtered

	if(isnull(@paging, 0) = 0)
	begin
		select	*
		from	#filtered
		order by CreatedTime desc

		select	ode.*,
				pro.Name as productName,
				pro.Picture as productPicture,
				pro.Summary as productSummary
		from	#filtered ord
		join	M_OrderDetail ode on ord.Id = ode.OrderId
		join	M_Product pro on ode.ProductId = pro.Id
	end
	else
	begin
		select	*
		into	#paged
		from	#filtered
		order by CreatedTime desc
		offset (@pageIndex - 1) * @pageSize rows
		fetch next @pageSize rows only

		select	*
		from	#paged

		select	ode.*,
				pro.Name as productName,
				pro.Picture as productPicture,
				pro.Summary as productSummary
		from	#paged ord
		join	M_OrderDetail ode on ord.Id = ode.OrderId
		join	M_Product pro on ode.ProductId = pro.Id
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Product]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Product]
(
	@id int = null,
	@categoryId int = null,
	@subCategoryId int = null,
	@name varchar(100) = null,
	@onsale bit = null,
	@deleted bit = null,
	@paging bit = 1,
	@pageIndex int = 1,
	@pageSize int = 15,
	@records int = 0 output
)
as
begin
	select	pro.*,
			ctg.Category,
			sub.Category as SubCategory
	into	#filtered
	from	M_Product pro
	join	M_ProductCategory ctg on pro.CategoryId = ctg.Id
	join	M_ProductCategory sub on pro.SubCategoryId = sub.Id
	where	pro.Id = isnull(@id, pro.id)
	and		pro.CategoryId = isnull(@categoryid, pro.categoryid)
	and		pro.SubCategoryId = isnull(@subcategoryId, pro.SubCategoryId)
	and		pro.Name like '%' + convert(varchar(100),isnull(@name, '')) + '%'
	and		pro.OnSale = isnull(@onsale, pro.Onsale)
	and		pro.Deleted = isnull(@deleted, pro.deleted)

	if(isnull(@paging, 0) = 0)
	begin
		select *
		from	#filtered
		order by Price, CategoryId
	end
	else
	begin
		select *
		from	#filtered
		order by Price, CategoryId
		offset (@pageIndex - 1) * @pageSize rows
		fetch next @pageSize rows only

		select @records = count(1) from #filtered
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_03]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_Product_03]
(
	@id int = null,
	@categoryId int = null,
	@subCategoryId int = null,
	@name varchar(100) = null,
	@onsale bit = null,
	@deleted bit = null,
	@paging bit = 1,
	@pageIndex int = 1,
	@pageSize int = 15,
	@records int = 0 output
)
as
begin
	select	pro.*,
			ctg.Category,
			sub.Category as SubCategory
	into	#filtered
	from	M_Product pro
	join	M_ProductCategory ctg on pro.CategoryId = ctg.Id
	join	M_ProductCategory sub on pro.SubCategoryId = sub.Id
	where	pro.Id = isnull(@id, pro.id)
	and		pro.CategoryId = isnull(@categoryid, pro.categoryid)
	and		pro.SubCategoryId = isnull(@subcategoryId, pro.SubCategoryId)
	and		pro.Name like '%' + convert(varchar(100),isnull(@name, '')) + '%'
	and		pro.OnSale = isnull(@onsale, pro.Onsale)
	and		pro.Deleted = isnull(@deleted, pro.deleted)
	select @records = count(1) from #filtered

	if(isnull(@paging, 0) = 0)
	begin
		select *
		from	#filtered
		order by Price, CategoryId
	end
	else
	begin
		select *
		from	#filtered
		order by Price, CategoryId
		offset (@pageIndex - 1) * @pageSize rows
		fetch next @pageSize rows only

		
	end
end




GO
/****** Object:  StoredProcedure [dbo].[PR_ProductCategory]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_ProductCategory]
(
	@id int = null,
	@parentId int = null,
	@category varchar(30) = null,
	@deleted bit = null,
	@isRecommend bit = null,
	@paging bit = 0,
	@pageIndex int = 1,
	@pageSize int = 15,
	@records int =0 output
)
as
begin
	select	sub.*,
			parent.Category as parentCategory
	into	#filtered
	from	M_ProductCategory sub
	left join	M_ProductCategory parent on sub.ParentId = parent.Id
	where	sub.id = isnull(@id, sub.id)
	and		sub.parentId = isnull(@parentId, sub.parentId)
	and		sub.category like '%' + convert(varchar(30), isnull(@category,'')) + '%'
	and		sub.deleted = isnull(@deleted, sub.deleted)
	and		sub.isrecommend = isnull(@isrecommend, sub.isrecommend)

	if(isnull(@paging,0) = 0)
	begin
		select * 
		from	#filtered
		order by CreatedTime desc
	end
	else
	begin
		select	*
		from	#filtered
		order by CreatedTime desc
		offset (@pageIndex - 1) * @pageSize rows
		fetch next @pageSize rows only

		select @records = count(*) from #filtered
	end
end
GO
/****** Object:  StoredProcedure [dbo].[pr_ProductCategory_03]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE	 Proc [dbo].[pr_ProductCategory_03] (
 		@id int=null,
		@parentid int =null,
		@category varchar(30)=null,
		@deleted bit=null,
		@isrecommend bit=null ,
		@isPaging bit=0   ,
		@pageindex int=1 ,
		@pagesize int=10,
		@records int output
 
 )as
 begin
	
	select child.* ,father.category	AS FatherCategory
	into #filter
	from M_ProductCategory	child
	left join	M_ProductCategory father on child.ParentId = father.Id
	where child.id=isnull(@id	,child.id)
	and child.category like '%'+convert(varchar(30),isnull(@category,''))+'%' 
	and child.parentid =ISNULL(@parentid,child.parentid)
	and child.deleted =isnull(@deleted,child.deleted)
	and child.isRecommend =ISNULL(@isrecommend,child.isRecommend)
	select @records=COUNT(Id)from #filter
	

	if(isnull(@ispaging,0)=0)
	begin
	--不分页
 	select 	* 
	from #filter
	order by CreatedTime desc
	end
	else
	begin
	--分页
	--select 	* from #filter
	--order by Id desc
	--offset (@pageindex-1)*@pagesize rows
	--fetch next @pagesize rows only

	select * 
	from (
	select *,ROW_NUMBER() over(order by CreatedTime desc) as rowNum
	from #filter  ) as t
	where rowNum between (@pageindex-1)*@pagesize+1 
	and @pageindex*@pagesize
	
	

	end
 end
GO
/****** Object:  StoredProcedure [dbo].[PR_ShoppingCart]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_ShoppingCart]
(
	@UserId int,
	@CartIds varchar(50) = null,
	@deleted bit = null,
	@paging bit = 0,
	@pageIndex int = 1,
	@pageSize int = 10,
	@records int = 0 output
)
as
begin
	declare @filtered table
	(
		id int,
		userId int,
		productId int,
		[count] int,
		deleted bit,
		CreatedTime datetime,
		ModifiedTime datetime,
		productName varchar(100),
		productPicture varchar(125),
		productPrice money,
		categoryName varchar(30),
		subCategoryName varchar(30)
	)

	if(@CartIds is null)
	begin
		insert into @filtered
		select	cart.*,
				pro.Name as productName,
				pro.Picture as productPicture,
				pro.Price as productPrice,
				ctg.Category as categoryName,
				subCtg.Category as subCategoryName
		from	M_ShoppingCart cart
		join	M_Product pro on cart.ProductId = pro.Id
		join	M_ProductCategory ctg on pro.CategoryId = ctg.Id
		join	M_ProductCategory subCtg on pro.SubCategoryId = subCtg.Id
		where	cart.UserId = @UserId
		and		cart.Deleted = isnull(@deleted, cart.Deleted)
	end
	else
	begin
		insert into @filtered
		select	cart.*,
				pro.Name as productName,
				pro.Picture as productPicture,
				pro.Price as productPrice,
				ctg.Category as categoryName,
				subCtg.Category as subCategoryName
		from	M_ShoppingCart cart
		join	M_Product pro on cart.ProductId = pro.Id
		join	M_ProductCategory ctg on pro.CategoryId = ctg.Id
		join	M_ProductCategory subCtg on pro.SubCategoryId = subCtg.Id
		where	cart.id in (@CartIds)
		and		cart.UserId = @UserId
	end

	select @records = count(1) from @filtered
	if(isnull(@paging, 0) = 0)
	begin
		select	*
		from	@filtered
		order by CreatedTime desc
	end
	else
	begin
		select	*
		from	@filtered
		order by CreatedTime desc
		offset (@pageIndex - 1)*@pageSize rows
		fetch next @pageSize rows only
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PR_User]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_User]
(
	@Id int = null,
    @NickName varchar(20) = null,
    @Gender int = null,
    @LoginId varchar(20) = null,
    @LoginPWD varchar(50) = null,
	@paging bit = 0,
	@pageIndex int = 1,
	@pageSize int = 10,
	@records int = 0 output
)
as
begin
	select	*
	into	#filterTable
	from	M_User
	where	Id = isnull(@id,id)
	and		isnull(NickName,'') like '%' + convert(varchar(20),isnull(@nickname,'')) + '%'
	and		Gender = isnull(@gender,Gender)
	and		LoginId = isnull(@loginId, loginId)
	and		LoginPWD = isnull(@loginPWD, loginPWD)
	
	if(isnull(@paging,0) = 0)
	begin
		select *
		from	#filterTable
		order by Id
	end
	else
	begin
		select *
		from	#filterTable
		order by Id
		offset (@pageIndex -1)*@pageSize rows
		fetch next @pageSize rows only

		set @records = (select count(1) from #filterTable)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[PU_Employee]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PU_Employee]
(
	@id int,
	@name varchar(20) = null,
	@gender  int = null,
	@phoneNumber varchar(20) = null,
	@loginPWD varchar(50) = null,
	@disabled bit = null,
	@email varchar(50) = null,
	@msg varchar(256) output
)
as
begin
	declare @success bit
	set @success = 0
	if not exists(select 1 
			from	M_Employee
			where	id = @id)
	begin
		set @msg = '找不到该用户'
		return @success
	end
	else if exists(select 1
		from	M_Employee
		where	id = @id
		and		IsSuper = 1)
	begin
		set @msg = '超级用户不允许修改'
		return @success
	end
	
	update	M_Employee
	set		Name = isnull(@name, Name),
			Gender = isnull(@gender, Gender),
			PhoneNumber = isnull(@phoneNumber, phoneNumber),
			LoginPWD = isnull(@loginPWD, loginPWD),
			[Disabled] = isnull(@disabled, [Disabled]),
			Email = isnull(@email, email),
			ModifiedTime = getdate()
	where	Id = @id

	set @success = 1
	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PU_Order]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PU_Order]
(
	@orderId int,
	@orderStatus int = null,
	@addressId int = null,
	@msg varchar(256) = '' output
)
as
begin
	declare @success bit 
	if not exists(select 1
			from M_Order
			where id = @orderId)
	begin
		set @success = 0
		set @msg = '不存在的订单'
	end
	else
	begin
		update	M_Order
		set		[Status] = isnull(@orderStatus, [Status]),
				UserAddressId = isnull(@addressId, UserAddressId),
				ModifiedTime = getdate()
		where	id = @orderId
		set @success = 1
	end

	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PU_Product]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PU_Product]
(
	@id int,
	@name varchar(100) = null,
	@categoryId int = null,
	@subCategoryId int = null,
	@price money = null,
	@summary varchar(250) = null,
	@description varchar(1000) = null,
	@picture varchar(125) = null,
	@onsale bit = null,
	@deleted bit = null,
	@msg varchar(256) output
)
as
begin
	declare @success bit = 0

	if exists(select 1
			from	M_Product
			where	CategoryId = @categoryId
			and		SubCategoryId = @subCategoryId
			and		Name = isnull(@name, Name)
			and		id <> @id)
	begin
		set @success = 0
		set @msg = '同类型商品中已存在名为' + convert(varchar(100),@name) + '的商品'
		return @success
	end

	update	M_Product
	set		Name = isnull(@name, Name),
			CategoryId = isnull(@categoryId, categoryId),
			SubCategoryId = isnull(@subCategoryId, subcategoryId),
			Summary = isnull(@summary, summary),
			Price = isnull(@price, price),
			Picture = isnull(@picture, picture),
			OnSale = isnull(@onSale, onsale),
			[Description] = isnull(@description, [Description]),
			Deleted = isnull(@deleted, [Deleted]),
			ModifiedTime = getdate()
	where	id = @id

	set @success = 1
	return @success
end
GO
/****** Object:  StoredProcedure [dbo].[PU_ProductCategory]    Script Date: 2020/7/9 14:17:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PU_ProductCategory]
(
	@id int,
	@parentId int = null,
	@category varchar(30) = null,
	@summary varchar(60) = null,
	@remark varchar(256) = null,
	@deleted bit = null,
	@isRecommend bit = null,
	@msg varchar(256) output
)
as
begin
	declare @success bit = 0
	if exists(select 1
		from	M_ProductCategory
		where	id <> @id
		and		ParentId = @parentId
		and		Category = @category)
	begin
		set @msg = '该商品分类名已存在'
		set @success = 0
		return @success
	end

	update	M_ProductCategory
	set		ParentId = isnull(@parentId,ParentId),
			Category = isnull(@category, Category),
			Summary = ISNULL(@summary, summary),
			Remark = isnull(@remark, remark),
			deleted = isnull(@deleted, deleted),
			isRecommend = isnull(@isRecommend, isRecommend)
	where	id = @id

	set @success = 1
	return @success
end
GO
USE [master]
GO
ALTER DATABASE [LinlangMall] SET  READ_WRITE 
GO
