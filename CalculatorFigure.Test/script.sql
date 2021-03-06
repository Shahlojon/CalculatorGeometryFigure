USE [master]
GO
/****** Object:  Database [TestDb]    Script Date: 17.01.2022 21:52:40 ******/
CREATE DATABASE [TestDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDb] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDb] SET  MULTI_USER 
GO
ALTER DATABASE [TestDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDb', N'ON'
GO
ALTER DATABASE [TestDb] SET QUERY_STORE = OFF
GO
USE [TestDb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17.01.2022 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 17.01.2022 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17.01.2022 21:52:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TestDb] SET  READ_WRITE 
GO



insert into Categories (name) values ('Инструменты');
insert into Categories (name) values ('Одежда');
insert into Categories (name) values ('Продукты');

insert into Products (name) values ('Дрель');
insert into Products (name) values ('Молоток');
insert into Products (name) values ('Пила');
insert into Products (name) values ('Джинсы');
insert into Products (name) values ('Рубашка');
insert into Products (name) values ('Куртка');
insert into Products (name) values ('Мясо');
insert into Products (name) values ('Молоко');
insert into Products (name) values ('Хлеб');
insert into Products (name) values ('Сьедобная одежда :)');
insert into Products (name) values ('Строительные ботинки');
insert into Products (name) values ('Товар без категории');


insert into ProductCategory(ProductId, CategoryId) values (1,1);
insert into ProductCategory(ProductId, CategoryId) values (2,1);
insert into ProductCategory(ProductId, CategoryId) values (3,1);
insert into ProductCategory(ProductId, CategoryId) values (4,2);
insert into ProductCategory(ProductId, CategoryId) values (5,2);
insert into ProductCategory(ProductId, CategoryId) values (6,2);

select p.name , c.name as result from Products p left join ProductCategory on p.id = ProductCategory.ProductId
left join Categories c on ProductCategory.CategoryId = c.id