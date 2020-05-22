﻿USE [master]
GO
/****** Object:  Database [GarmentFactory]    Script Date: 29.04.2020 15:05:27 ******/
/****** Здесь был Шкляник ******/
CREATE DATABASE [GarmentFactory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GarmentFactory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GarmentFactory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GarmentFactory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GarmentFactory_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GarmentFactory] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GarmentFactory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GarmentFactory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GarmentFactory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GarmentFactory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GarmentFactory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GarmentFactory] SET ARITHABORT OFF 
GO
ALTER DATABASE [GarmentFactory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GarmentFactory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GarmentFactory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GarmentFactory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GarmentFactory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GarmentFactory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GarmentFactory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GarmentFactory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GarmentFactory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GarmentFactory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GarmentFactory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GarmentFactory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GarmentFactory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GarmentFactory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GarmentFactory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GarmentFactory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GarmentFactory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GarmentFactory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GarmentFactory] SET  MULTI_USER 
GO
ALTER DATABASE [GarmentFactory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GarmentFactory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GarmentFactory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GarmentFactory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GarmentFactory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GarmentFactory] SET QUERY_STORE = OFF
GO
USE [GarmentFactory]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 29.04.2020 15:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[ЭтапВыполнения] [nvarchar](50) NOT NULL,
	[Заказчик] [nvarchar](50) NOT NULL,
	[Менеджер] [nvarchar](50) NULL,
	[Стоимость] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Заказ_1] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗаказанныеИзделия]    Script Date: 29.04.2020 15:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗаказанныеИзделия](
	[АртикулИзделия] [nvarchar](50) NOT NULL,
	[НомерЗаказа] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_ЗаказанныеИзделия] PRIMARY KEY CLUSTERED 
(
	[АртикулИзделия] ASC,
	[НомерЗаказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Изделие]    Script Date: 29.04.2020 15:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Изделие](
	[Артикул] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Ширина] [float] NOT NULL,
	[Длина] [float] NOT NULL,
	[Изображение] [image] NULL,
	[Комментарий] [nvarchar](150) NULL,
 CONSTRAINT [PK_Изделие] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[Роль] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СкладТкани]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СкладТкани](
	[Рулон] [uniqueidentifier] NOT NULL,
	[АртикулТкани] [nvarchar](50) NOT NULL,
	[Ширина] [float] NOT NULL,
	[Длина] [float] NOT NULL,
 CONSTRAINT [PK_СкладТкани_1] PRIMARY KEY CLUSTERED 
(
	[Рулон] ASC,
	[АртикулТкани] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СкладФурнитуры]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СкладФурнитуры](
	[Партия] [uniqueidentifier] NOT NULL,
	[АртикулФурнитуры] [nvarchar](50) NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_СкладФурнитуры] PRIMARY KEY CLUSTERED 
(
	[Партия] ASC,
	[АртикулФурнитуры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ТканиИзделия]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ТканиИзделия](
	[АртикулТкани] [nvarchar](50) NOT NULL,
	[АртикулИзделия] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ТканиИзделия] PRIMARY KEY CLUSTERED 
(
	[АртикулТкани] ASC,
	[АртикулИзделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ткань]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ткань](
	[Артикул] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Цвет] [nvarchar](50) NULL,
	[Рисунок] [nvarchar](50) NULL,
	[Изображение] [image] NULL,
	[Состав] [nvarchar](50) NULL,
	[Ширина] [float] NOT NULL,
	[Длина] [float] NOT NULL,
	[Цена] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Ткань] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура](
	[Артикул] [nvarchar](50) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Тип] [nvarchar](50) NOT NULL,
	[Ширина] [float] NOT NULL,
	[Длина] [float] NULL,
	[Вес] [float] NULL,
	[Изображение] [image] NULL,
	[Цена] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Фурнитура] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ФурнитураИзделия]    Script Date: 29.04.2020 15:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФурнитураИзделия](
	[АртикулФурнитуры] [nvarchar](50) NOT NULL,
	[АртикулИзделия] [nvarchar](50) NOT NULL,
	[Размещение] [nvarchar](50) NOT NULL,
	[Ширина] [float] NULL,
	[Длина] [float] NULL,
	[Поворот] [decimal](18, 2) NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_ФурнитураИзделия] PRIMARY KEY CLUSTERED 
(
	[АртикулФурнитуры] ASC,
	[АртикулИзделия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Роль], [Наименование]) VALUES (N'Dir', N'56789', N'Директор', NULL)
INSERT [dbo].[Пользователь] ([Логин], [Пароль], [Роль], [Наименование]) VALUES (N'Manag', N'12345', N'Менеджер', NULL)
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователь] FOREIGN KEY([Менеджер])
REFERENCES [dbo].[Пользователь] ([Логин])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователь]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователь1] FOREIGN KEY([Заказчик])
REFERENCES [dbo].[Пользователь] ([Логин])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователь1]
GO
ALTER TABLE [dbo].[ЗаказанныеИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ЗаказанныеИзделия_Заказ] FOREIGN KEY([НомерЗаказа])
REFERENCES [dbo].[Заказ] ([Номер])
GO
ALTER TABLE [dbo].[ЗаказанныеИзделия] CHECK CONSTRAINT [FK_ЗаказанныеИзделия_Заказ]
GO
ALTER TABLE [dbo].[ЗаказанныеИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ЗаказанныеИзделия_Изделие] FOREIGN KEY([АртикулИзделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[ЗаказанныеИзделия] CHECK CONSTRAINT [FK_ЗаказанныеИзделия_Изделие]
GO
ALTER TABLE [dbo].[СкладТкани]  WITH CHECK ADD  CONSTRAINT [FK_СкладТкани_Ткань] FOREIGN KEY([АртикулТкани])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[СкладТкани] CHECK CONSTRAINT [FK_СкладТкани_Ткань]
GO
ALTER TABLE [dbo].[СкладФурнитуры]  WITH CHECK ADD  CONSTRAINT [FK_СкладФурнитуры_Фурнитура] FOREIGN KEY([АртикулФурнитуры])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[СкладФурнитуры] CHECK CONSTRAINT [FK_СкладФурнитуры_Фурнитура]
GO
ALTER TABLE [dbo].[ТканиИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ТканиИзделия_Изделие] FOREIGN KEY([АртикулИзделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[ТканиИзделия] CHECK CONSTRAINT [FK_ТканиИзделия_Изделие]
GO
ALTER TABLE [dbo].[ТканиИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ТканиИзделия_Ткань] FOREIGN KEY([АртикулТкани])
REFERENCES [dbo].[Ткань] ([Артикул])
GO
ALTER TABLE [dbo].[ТканиИзделия] CHECK CONSTRAINT [FK_ТканиИзделия_Ткань]
GO
ALTER TABLE [dbo].[ФурнитураИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ФурнитураИзделия_Изделие] FOREIGN KEY([АртикулИзделия])
REFERENCES [dbo].[Изделие] ([Артикул])
GO
ALTER TABLE [dbo].[ФурнитураИзделия] CHECK CONSTRAINT [FK_ФурнитураИзделия_Изделие]
GO
ALTER TABLE [dbo].[ФурнитураИзделия]  WITH CHECK ADD  CONSTRAINT [FK_ФурнитураИзделия_Фурнитура] FOREIGN KEY([АртикулФурнитуры])
REFERENCES [dbo].[Фурнитура] ([Артикул])
GO
ALTER TABLE [dbo].[ФурнитураИзделия] CHECK CONSTRAINT [FK_ФурнитураИзделия_Фурнитура]
GO
USE [master]
GO
ALTER DATABASE [GarmentFactory] SET  READ_WRITE 
GO
