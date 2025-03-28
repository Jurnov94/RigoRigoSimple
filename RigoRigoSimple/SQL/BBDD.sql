USE [master]
GO
/****** Object:  Database [RigoRigo]    Script Date: 23/03/2025 11:23:55 a. m. ******/
CREATE DATABASE [RigoRigo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RigoRigo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RigoRigo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RigoRigo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RigoRigo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RigoRigo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RigoRigo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RigoRigo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RigoRigo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RigoRigo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RigoRigo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RigoRigo] SET ARITHABORT OFF 
GO
ALTER DATABASE [RigoRigo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RigoRigo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RigoRigo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RigoRigo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RigoRigo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RigoRigo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RigoRigo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RigoRigo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RigoRigo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RigoRigo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RigoRigo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RigoRigo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RigoRigo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RigoRigo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RigoRigo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RigoRigo] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RigoRigo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RigoRigo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RigoRigo] SET  MULTI_USER 
GO
ALTER DATABASE [RigoRigo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RigoRigo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RigoRigo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RigoRigo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RigoRigo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RigoRigo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RigoRigo] SET QUERY_STORE = ON
GO
ALTER DATABASE [RigoRigo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RigoRigo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/03/2025 11:23:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 23/03/2025 11:23:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesDetalles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ordenProcesadaId] [uniqueidentifier] NOT NULL,
	[ProductoId] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrdenesDetalles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesProcesadas]    Script Date: 23/03/2025 11:23:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesProcesadas](
	[Id] [uniqueidentifier] NOT NULL,
	[Cedula] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrdenesProcesadas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23/03/2025 11:23:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](450) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250322231548_NuevaDB', N'8.0.14')
GO
SET IDENTITY_INSERT [dbo].[OrdenesDetalles] ON 

INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (2, N'11967b8a-c726-4dfd-a4f9-3419530de7b7', N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 2, CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (3, N'11967b8a-c726-4dfd-a4f9-3419530de7b7', N'3fa85f64-5717-4562-b3fc-2c963f66afa7', 1, CAST(360000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (4, N'11967b8a-c726-4dfd-a4f9-3419530de7b7', N'3fa85f64-5717-4562-b3fc-2c963f66afa8', 3, CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (5, N'11967b8a-c726-4dfd-a4f9-3419530de7b7', N'3fa85f64-5717-4562-b3fc-2c963f66afa9', 2, CAST(360000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (6, N'7740717e-582d-4583-81cf-93df91d0d0b0', N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (7, N'63652af4-79a6-44fc-9a76-0f2acfd80c1c', N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1, CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (8, N'63652af4-79a6-44fc-9a76-0f2acfd80c1c', N'3fa85f64-5717-4562-b3fc-2c963f66afa7', 1, CAST(360000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (9, N'fa801ead-56fb-4fed-a62b-836664e84a59', N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 2, CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrdenesDetalles] ([Id], [ordenProcesadaId], [ProductoId], [Cantidad], [PrecioUnitario]) VALUES (10, N'fa801ead-56fb-4fed-a62b-836664e84a59', N'3fa85f64-5717-4562-b3fc-2c963f66afa7', 2, CAST(360000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrdenesDetalles] OFF
GO
INSERT [dbo].[OrdenesProcesadas] ([Id], [Cedula], [Direccion]) VALUES (N'63652af4-79a6-44fc-9a76-0f2acfd80c1c', N'369852147', N'calle amor')
INSERT [dbo].[OrdenesProcesadas] ([Id], [Cedula], [Direccion]) VALUES (N'11967b8a-c726-4dfd-a4f9-3419530de7b7', N'string', N'string')
INSERT [dbo].[OrdenesProcesadas] ([Id], [Cedula], [Direccion]) VALUES (N'fa801ead-56fb-4fed-a62b-836664e84a59', N'85214785', N'carrera 22 - 20')
INSERT [dbo].[OrdenesProcesadas] ([Id], [Cedula], [Direccion]) VALUES (N'7740717e-582d-4583-81cf-93df91d0d0b0', N'string', N'string')
GO
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'teclado K50', N'Teclado mecanico logic', CAST(350000.00 AS Decimal(18, 2)))
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa7', N'teclado K60', N'Teclado mecanico logic', CAST(360000.00 AS Decimal(18, 2)))
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa8', N'Mouse K50', N'Mouse gamer logic', CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[Productos] ([Id], [Nombre], [Descripcion], [Precio]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa9', N'Mouse K60', N'Mouse gamer logic', CAST(260000.00 AS Decimal(18, 2)))
GO
/****** Object:  Index [IX_OrdenesDetalles_ordenProcesadaId]    Script Date: 23/03/2025 11:23:56 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_OrdenesDetalles_ordenProcesadaId] ON [dbo].[OrdenesDetalles]
(
	[ordenProcesadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Productos_Nombre]    Script Date: 23/03/2025 11:23:56 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Productos_Nombre] ON [dbo].[Productos]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_OrdenesProcesadas_ordenProcesadaId] FOREIGN KEY([ordenProcesadaId])
REFERENCES [dbo].[OrdenesProcesadas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_OrdenesProcesadas_ordenProcesadaId]
GO
/****** Object:  StoredProcedure [dbo].[InsertarPedido]    Script Date: 23/03/2025 11:23:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPedido]
    @Cedula NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Productos NVARCHAR(MAX)
AS
BEGIN
    DECLARE @OrdenId UNIQUEIDENTIFIER;

    SET @OrdenId = NEWID();

    INSERT INTO OrdenesProcesadas (Id, Cedula, Direccion)
    VALUES (@OrdenId, @Cedula, @Direccion);

    IF @OrdenId IS NULL
    BEGIN
        RAISERROR('No se pudo generar el GUID de la orden procesada', 16, 1);
        RETURN;
    END

    INSERT INTO OrdenesDetalles (OrdenProcesadaId, ProductoId, Cantidad, PrecioUnitario)
    SELECT 
        @OrdenId,
        ProductoId,
        Cantidad,
        PrecioUnitario
    FROM OPENJSON(@Productos)
    WITH (
        ProductoId UNIQUEIDENTIFIER,
        Cantidad INT,
        PrecioUnitario DECIMAL(18,2)
    );
END
GO
USE [master]
GO
ALTER DATABASE [RigoRigo] SET  READ_WRITE 
GO
