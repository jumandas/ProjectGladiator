USE [master]
GO
/****** Object:  Database [dbNewBus]    Script Date: 26-11-2020 15:52:27 ******/
CREATE DATABASE [dbNewBus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbNewBus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbNewBus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbNewBus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbNewBus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbNewBus] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbNewBus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbNewBus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbNewBus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbNewBus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbNewBus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbNewBus] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbNewBus] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbNewBus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbNewBus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbNewBus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbNewBus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbNewBus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbNewBus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbNewBus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbNewBus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbNewBus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbNewBus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbNewBus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbNewBus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbNewBus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbNewBus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbNewBus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbNewBus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbNewBus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbNewBus] SET  MULTI_USER 
GO
ALTER DATABASE [dbNewBus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbNewBus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbNewBus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbNewBus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbNewBus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbNewBus] SET QUERY_STORE = OFF
GO
USE [dbNewBus]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminId] [int] NOT NULL,
	[EmailId] [varchar](40) NULL,
	[username] [varchar](30) NULL,
	[Password_] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[Index_Book] [int] IDENTITY(1,1) NOT NULL,
	[BookingID]  AS ('B'+right('00000000'+CONVERT([varchar](8),[Index_Book]),(8))) PERSISTED NOT NULL,
	[Source_B] [varchar](30) NOT NULL,
	[Destination_B] [varchar](30) NOT NULL,
	[StartDate] [varchar](15) NOT NULL,
	[StartTime] [varchar](20) NOT NULL,
	[TicketType] [varchar](20) NOT NULL,
	[TravelFare] [real] NOT NULL,
	[PaymentId] [varchar](9) NULL,
	[CustUsername] [varchar](40) NULL,
	[EmailId] [nvarchar](25) NULL,
	[BusNo] [varchar](15) NULL,
	[SelectedSeats] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBus]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBus](
	[BusNo] [varchar](15) NOT NULL,
	[NoOfSeats] [int] NOT NULL,
	[Source_] [varchar](25) NOT NULL,
	[Destination] [varchar](25) NOT NULL,
	[ViaStop] [varchar](25) NOT NULL,
	[StartTime] [varchar](20) NOT NULL,
	[EndTime] [varchar](20) NOT NULL,
	[PerSeatCost] [real] NOT NULL,
	[BusType] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BusNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCancellation]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCancellation](
	[PaymentId] [varchar](9) NULL,
	[BookingId] [varchar](9) NULL,
	[Refund] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[Index_] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](40) NOT NULL,
	[Fname] [varchar](30) NULL,
	[Lname] [varchar](30) NULL,
	[Password_] [varchar](20) NULL,
	[EmailId] [nvarchar](40) NULL,
	[ContactNo] [varchar](20) NULL,
	[Address] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Gender] [varchar](10) NULL,
	[WalletDetails] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[Index_Pay] [int] IDENTITY(1,1) NOT NULL,
	[PaymentId]  AS ('P'+right('00000000'+CONVERT([varchar](8),[Index_Pay]),(8))) PERSISTED NOT NULL,
	[Amount] [real] NOT NULL,
	[PaymentBy] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReturnTicket]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReturnTicket](
	[BookingID] [varchar](9) NULL,
	[Return_data] [varchar](10) NULL,
	[Return_Time] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUnAuthCustomer]    Script Date: 26-11-2020 15:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUnAuthCustomer](
	[Fname] [varchar](30) NOT NULL,
	[Lname] [varchar](30) NOT NULL,
	[EmailId] [nvarchar](25) NOT NULL,
	[PhoneNo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD FOREIGN KEY([BusNo])
REFERENCES [dbo].[tblBus] ([BusNo])
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD FOREIGN KEY([CustUsername])
REFERENCES [dbo].[tblCustomer] ([username])
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD FOREIGN KEY([EmailId])
REFERENCES [dbo].[tblUnAuthCustomer] ([EmailId])
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[tblPayment] ([PaymentId])
GO
ALTER TABLE [dbo].[tblCancellation]  WITH CHECK ADD FOREIGN KEY([BookingId])
REFERENCES [dbo].[tblBooking] ([BookingID])
GO
ALTER TABLE [dbo].[tblCancellation]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[tblPayment] ([PaymentId])
GO
ALTER TABLE [dbo].[tblReturnTicket]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[tblBooking] ([BookingID])
GO
USE [master]
GO
ALTER DATABASE [dbNewBus] SET  READ_WRITE 
GO
