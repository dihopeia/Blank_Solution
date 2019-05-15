USE [Web.DataModel.Entity_Data_ Modell]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019. 05. 14. 15:31:48 ******/
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2019. 05. 14. 15:31:48 ******/
DROP TABLE [dbo].[__MigrationHistory]
GO
USE [master]
GO
/****** Object:  Database [Web.DataModel.Entity_Data_ Modell]    Script Date: 2019. 05. 14. 15:31:48 ******/
DROP DATABASE [Web.DataModel.Entity_Data_ Modell]
GO
/****** Object:  Database [Web.DataModel.Entity_Data_ Modell]    Script Date: 2019. 05. 14. 15:31:48 ******/
CREATE DATABASE [Web.DataModel.Entity_Data_ Modell]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web.DataModel.Entity_Data_ Modell', FILENAME = N'C:\Users\Training\Web.DataModel.Entity_Data_ Modell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web.DataModel.Entity_Data_ Modell_log', FILENAME = N'C:\Users\Training\Web.DataModel.Entity_Data_ Modell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web.DataModel.Entity_Data_ Modell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET  MULTI_USER 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET QUERY_STORE = OFF
GO
USE [Web.DataModel.Entity_Data_ Modell]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Web.DataModel.Entity_Data_ Modell]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2019. 05. 14. 15:31:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019. 05. 14. 15:31:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UrlFriendlyName] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201905141312513_ProductBevezetese', N'Web.Migrations.Configuration', 0x1F8B0800000000000400CD57C96EDB4810BD0F907F68F42903386A2F9719834CE04851604C641BA19D391A2DB22437D26C32BD18D2B7E5309F34BF30C57D9364290A828100412A56BDAA7A5D4BF3DFEFFF78EF56B124CFA08D48944FCF46A794800A9348A8A54F9D5DBCF983BE7BFBEA37EF4314AFC8974AEF22D3434B657CFA646D7AC998099F20E666148B50272659D85198C48C47093B3F3DFD939D9D3140088A5884789F9DB22286FC0FFE1D272A84D43A2E674904D294727C12E4A8E486C760521E824FFF86F968C22DCF3529B99282631001C805255CA9C4728B215E3E1808AC4ED4324851C0E5FD3A05D45B7069A00CFDB251DF378BD3F32C0BD6185650A13336890F043CBB2869617DF31F2297D6B421711F9060BBCEB2CEC9F3E99D4E22175A4349DFD9E558EA4CB1E0B6388151A57E425078529F3C1648F639216327ADD3E02B7056737942EEDC5C8AF02F58DF275F41F9CA49D90E0843C2671D018AD04B0ADAAE3FC3A20CF37A4209EBDAB1BE616DD6B22912F8E84444C90DFAE67309F571B39DE6D97705803583954FC98CAF3E815ADA279FE24F4AA66205512529511F94C0464123ABDD8B4E1EB49C6A012A92EB5FE2EF4E8BB0F672ADECC5F9C1BC4CC0845AA4453DFED4703DD694E7B068711A582E14E8328E42FA9835FDE3635E9E72431163C397756C4A97DDE40A94006CB71F28694229C6C8A8E9944D31D7D135438A1553AA9A666CCB38F3663C4D91BED6782B25242866DBF84D7078E7C705060BCD860150475B7BB289E64BE83D45D718E9546863339AE73C3BC071140FD4369DC5169E2B8F5DBAFB13A061BFD2CF7E17369D51DF1C4B0FA2A1718A99C5A06C9E24D481B466DFC0345F315C72BD61A48C13E962B56D2CEDB22E3ABC6D5F48F647188C8B36D8E0E1FEB8E55868A395A2FD313A73A18DD47930C4F358EF9CFAB5C006C5D05B04FDDADAD59E7D95DA7BDDA6BD76F4CAD678F90A32E89542851224EA5944599F046B6321CEAB77147C936389C7651B8519576201C616BB92E255E0BC7795F9FF5C2B983191DCF36EF1CB17BE53E29B03A414435A08D0472D7FF5CC75F8C4F5EB98AF7E6F231DB1E08FC2EC2C719115D0F12BFC80800E5BD3C30DB2D702363B3770D1593E8DE6092650047AF47E1E36BAC7DA6F241ED226960D44F67EA220CC586C402B9D6BB5482AD631B97644954AEF50666079841C5D69AC591E5A7C1C8231F9C5EA0B972EBBF2C47388AED5ADB3A9B357C6403C97EB76BE1EDBED3FBF847463F66EF33A303F23050C53600A70ABDE3B21A33AEEE9B028B74164E5F211509E4F26BC5822DC725D23DD246A4FA092BE09A4D87C3807EE214E2582995B15F067F891D8F02EF909963C5C57F37A3BC8CB07D1A5DD9B08BED43C362546639FBD65B3EC35FBED7F540F4BA2980F0000, N'6.2.0-61023')
INSERT [dbo].[Products] ([ID], [Name], [UrlFriendlyName], [Price], [Description]) VALUES (N'972930cd-9fd7-4a63-86c4-36e406e140b4', N'Teszt', NULL, 200, N'leírás')
USE [master]
GO
ALTER DATABASE [Web.DataModel.Entity_Data_ Modell] SET  READ_WRITE 
GO
