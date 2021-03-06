USE [master]
GO
/****** Object:  Database [Diploma]    Script Date: 26/11/2020 18:50:58 ******/
CREATE DATABASE [Diploma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Diploma', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Diploma.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Diploma_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Diploma_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Diploma] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Diploma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Diploma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Diploma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Diploma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Diploma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Diploma] SET ARITHABORT OFF 
GO
ALTER DATABASE [Diploma] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Diploma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Diploma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Diploma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Diploma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Diploma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Diploma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Diploma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Diploma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Diploma] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Diploma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Diploma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Diploma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Diploma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Diploma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Diploma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Diploma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Diploma] SET RECOVERY FULL 
GO
ALTER DATABASE [Diploma] SET  MULTI_USER 
GO
ALTER DATABASE [Diploma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Diploma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Diploma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Diploma] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Diploma] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Diploma', N'ON'
GO
ALTER DATABASE [Diploma] SET QUERY_STORE = OFF
GO
USE [Diploma]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[descripcion] [nvarchar](400) NOT NULL,
	[criticidad] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[dvh] [bigint] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [int] NOT NULL,
	[nro_documento] [bigint] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[domicilio] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[telefono] [bigint] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[es_consignacion] [nvarchar](50) NULL,
	[id_vehiculo] [int] NULL,
	[precio_sugerido] [nvarchar](50) NULL,
	[id_cliente] [int] NULL,
	[legajo_empleado] [int] NULL,
	[fecha] [datetime] NULL,
	[dvh] [bigint] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compuesto]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compuesto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_familia] [int] NOT NULL,
	[id_patente] [int] NOT NULL,
 CONSTRAINT [PK_Compuesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Digito_Verificador]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digito_Verificador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tabla] [nvarchar](50) NOT NULL,
	[dvv] [bigint] NOT NULL,
 CONSTRAINT [PK_DigitoVerificador] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[legajo] [int] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [int] NOT NULL,
	[nro_documento] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[domicilio] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[telefono] [int] NULL,
	[estado] [int] NOT NULL,
	[id_usuario] [int] NULL,
 CONSTRAINT [PK_Empleado_1] PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resultado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](70) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[es_default] [bit] NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patente]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[es_familia] [bit] NOT NULL,
	[dvh] [int] NOT NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteUsuario]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatenteUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_patente] [int] NOT NULL,
 CONSTRAINT [PK_PatenteUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traduccion]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traduccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_etiqueta] [int] NOT NULL,
	[id_idioma] [int] NOT NULL,
	[traduccion] [nvarchar](200) NULL,
 CONSTRAINT [PK_Traduccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contrasena] [nvarchar](50) NULL,
	[contador] [int] NULL,
	[estado] [int] NULL,
	[email] [nvarchar](50) NULL,
	[dvh] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiculoStock]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculoStock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patente] [nvarchar](50) NULL,
	[tipo_vehiculo] [int] NULL,
	[marca] [nvarchar](50) NULL,
	[modelo] [nvarchar](50) NULL,
	[anio] [int] NULL,
	[version] [nvarchar](50) NULL,
	[kilometraje] [int] NULL,
	[color] [nvarchar](50) NULL,
	[id_estado] [int] NULL,
	[precio] [nvarchar](50) NULL,
	[adquirido] [bit] NULL,
	[disponible] [bit] NULL,
	[id_cliente] [int] NULL,
	[dvh] [bigint] NULL,
 CONSTRAINT [PK_VehiculoStock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 26/11/2020 18:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[precio] [int] NULL,
	[id_cliente] [int] NULL,
	[legajo_empleado] [int] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (1, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:04:33.000' AS DateTime), 95956)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (2, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:04:33.000' AS DateTime), 148502)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (3, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:05:14.000' AS DateTime), 95955)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (4, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:05:14.000' AS DateTime), 148501)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (5, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:08:29.000' AS DateTime), 96116)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (6, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:08:29.000' AS DateTime), 148662)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (7, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:09:09.000' AS DateTime), 96096)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (8, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:09:09.000' AS DateTime), 148642)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (9, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:10:14.000' AS DateTime), 95890)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (10, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:10:14.000' AS DateTime), 148436)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (11, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:16:46.000' AS DateTime), 96078)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (12, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:16:46.000' AS DateTime), 148624)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (13, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:17:56.000' AS DateTime), 96112)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (14, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:17:56.000' AS DateTime), 148658)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (15, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:18:34.000' AS DateTime), 96054)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (16, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:18:34.000' AS DateTime), 148600)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (17, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:20:01.000' AS DateTime), 95830)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (18, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:20:01.000' AS DateTime), 148376)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (19, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:21:14.000' AS DateTime), 95921)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (20, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:21:14.000' AS DateTime), 148467)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (21, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:26:12.000' AS DateTime), 95963)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (22, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:26:12.000' AS DateTime), 148509)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (23, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:33:00.000' AS DateTime), 95874)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (24, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:33:00.000' AS DateTime), 148420)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (25, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:41:37.000' AS DateTime), 96044)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (26, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:41:37.000' AS DateTime), 148590)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (27, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:45:15.000' AS DateTime), 96034)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (28, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:45:15.000' AS DateTime), 148580)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (29, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:47:56.000' AS DateTime), 96157)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (30, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:47:56.000' AS DateTime), 148703)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (31, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSB5YSBleGlzdGU=', 1, CAST(N'2020-11-26T15:48:25.000' AS DateTime), 138597)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (32, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T15:55:10.000' AS DateTime), 95954)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (33, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T15:55:10.000' AS DateTime), 148500)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (34, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyBzZSBlbmN1ZW50cmEgZGVudHJvIGRlIGxvcyBtYXMgdmVuZGlkb3MgZGVsIG1lcmNhZG8=', 1, CAST(N'2020-11-26T15:55:40.000' AS DateTime), 600586)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (35, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyBzZSBlbmN1ZW50cmEgZGVudHJvIGRlIGxvcyBtYXMgdmVuZGlkb3MgZGVsIG1lcmNhZG8=', 1, CAST(N'2020-11-26T15:57:01.000' AS DateTime), 600565)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (36, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:03:17.000' AS DateTime), 95993)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (37, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:03:17.000' AS DateTime), 148539)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (38, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:04:02.000' AS DateTime), 288099)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (39, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBubyBlcyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDA=', 1, CAST(N'2020-11-26T16:04:24.000' AS DateTime), 212223)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (40, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:14:11.000' AS DateTime), 95910)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (41, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:14:11.000' AS DateTime), 148456)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (42, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:15:10.000' AS DateTime), 288110)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (43, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBubyBlcyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDA=', 1, CAST(N'2020-11-26T16:15:24.000' AS DateTime), 212254)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (44, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:15:26.000' AS DateTime), 288242)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (45, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:16:17.000' AS DateTime), 288259)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (46, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:18:54.000' AS DateTime), 96103)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (47, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:18:54.000' AS DateTime), 148649)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (48, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:19:24.000' AS DateTime), 288268)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (49, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:19:51.000' AS DateTime), 185188)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (50, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:23:30.000' AS DateTime), 288129)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (51, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:26:41.000' AS DateTime), 96011)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (52, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:26:41.000' AS DateTime), 148557)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (53, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:27:07.000' AS DateTime), 288272)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (54, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:27:18.000' AS DateTime), 185232)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (55, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:29:17.000' AS DateTime), 96119)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (56, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:29:17.000' AS DateTime), 148665)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (57, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:29:39.000' AS DateTime), 288396)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (58, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:30:04.000' AS DateTime), 185041)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (59, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:30:56.000' AS DateTime), 96043)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (60, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:30:56.000' AS DateTime), 148589)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (61, 1003, N'RWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBubyB0aWVuZSB1biBlc3RhZG8gYWNlcHRhYmxl', 1, CAST(N'2020-11-26T16:31:34.000' AS DateTime), 288188)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (62, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:31:46.000' AS DateTime), 185167)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (63, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:35:49.000' AS DateTime), 96162)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (64, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:35:49.000' AS DateTime), 148708)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (65, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:37:26.000' AS DateTime), 185227)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (66, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:37:47.000' AS DateTime), 96156)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (67, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:37:47.000' AS DateTime), 148702)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (68, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:38:27.000' AS DateTime), 185262)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (69, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:41:02.000' AS DateTime), 95908)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (70, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:41:02.000' AS DateTime), 148454)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (71, 1003, N'RXN0YWRvIGRlbCB2ZWhpY3VsbyBhY2VwdGFibGUsIHJlc3VsdGFkbyA9IDEwMA==', 1, CAST(N'2020-11-26T16:41:44.000' AS DateTime), 185144)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (72, 1003, N'U2UgcmVhbGl6byBlbCBhbHRhIGRlbCB2ZWhpY3VsbyBkZSBwYXRlbnRlID0gQktaMjUx', 2, CAST(N'2020-11-26T16:41:55.000' AS DateTime), 222808)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (73, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIEhvcml6b250YWwgZGUgbGEgdGFibGEgVmVoaWN1bG9TdG9jayANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gOTIzOCAsIEFsbWFjZW5hZG8gPSAxMjMzNQ==', 1, CAST(N'2020-11-26T16:46:10.000' AS DateTime), 2812928)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (74, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:46:10.000' AS DateTime), 95968)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (75, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T16:46:32.000' AS DateTime), 153518)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (76, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:46:34.000' AS DateTime), 96080)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (77, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:46:34.000' AS DateTime), 148626)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (78, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:49:01.000' AS DateTime), 96017)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (79, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:49:01.000' AS DateTime), 148563)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (80, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:54:41.000' AS DateTime), 96024)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (81, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:54:41.000' AS DateTime), 148570)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (82, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:55:39.000' AS DateTime), 96174)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (83, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:55:39.000' AS DateTime), 148720)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (84, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T16:59:49.000' AS DateTime), 96256)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (85, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T16:59:49.000' AS DateTime), 148802)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (86, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:02:52.000' AS DateTime), 95967)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (87, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:02:52.000' AS DateTime), 148513)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (88, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:05:31.000' AS DateTime), 95960)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (89, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:05:31.000' AS DateTime), 148506)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (90, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:06:01.000' AS DateTime), 986848)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (91, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDg1MDAwMA==', 3, CAST(N'2020-11-26T17:08:34.000' AS DateTime), 969388)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (92, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDg1MDAwMA==', 3, CAST(N'2020-11-26T17:19:05.000' AS DateTime), 969384)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (93, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkwMDAwMA==', 3, CAST(N'2020-11-26T17:19:11.000' AS DateTime), 979978)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (94, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:20:49.000' AS DateTime), 987006)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (95, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:21:34.000' AS DateTime), 986909)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (96, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDgwNzQwMA==', 3, CAST(N'2020-11-26T17:25:51.000' AS DateTime), 989810)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (97, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:31:53.000' AS DateTime), 96015)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (98, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:31:53.000' AS DateTime), 148561)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (99, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:32:02.000' AS DateTime), 986848)
GO
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (100, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIFZlcnRpY2FsIGRlIGxhIHRhYmxhIFZlaGljdWxvU3RvY2sgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm8gY29pbmNpZGUuIENhbGN1bGFkbyA9IDkyMzggLCBBbG1hY2VuYWRvID0gMTM4MTk=', 1, CAST(N'2020-11-26T17:36:47.000' AS DateTime), 2732026)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (101, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:36:47.000' AS DateTime), 96153)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (102, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T17:37:01.000' AS DateTime), 153459)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (103, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:37:03.000' AS DateTime), 96021)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (104, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:37:03.000' AS DateTime), 148567)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (105, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:37:15.000' AS DateTime), 987003)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (106, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIFZlcnRpY2FsIGRlIGxhIHRhYmxhIFZlaGljdWxvU3RvY2sgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm8gY29pbmNpZGUuIENhbGN1bGFkbyA9IDkyMzggLCBBbG1hY2VuYWRvID0gMTM4MTk=', 1, CAST(N'2020-11-26T17:45:53.000' AS DateTime), 2731967)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (107, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:45:53.000' AS DateTime), 96094)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (108, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T17:45:56.000' AS DateTime), 153627)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (109, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:45:58.000' AS DateTime), 96189)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (110, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:45:58.000' AS DateTime), 148735)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (111, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:46:06.000' AS DateTime), 987003)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (112, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIEhvcml6b250YWwgZGUgbGEgdGFibGEgVmVoaWN1bG9TdG9jayANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gMTEyMDcgLCBBbG1hY2VuYWRvID0gMTM4MTk=', 1, CAST(N'2020-11-26T17:47:06.000' AS DateTime), 2785437)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (113, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIFZlcnRpY2FsIGRlIGxhIHRhYmxhIENvbXByYSANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gMCAsIEFsbWFjZW5hZG8gPSAxNTYyMA==', 1, CAST(N'2020-11-26T17:47:06.000' AS DateTime), 2474450)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (114, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:47:06.000' AS DateTime), 96093)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (115, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T17:47:09.000' AS DateTime), 153626)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (116, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:47:10.000' AS DateTime), 95997)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (117, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:47:10.000' AS DateTime), 148543)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (118, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:47:19.000' AS DateTime), 987094)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (119, 1003, N'U2UgcmVhbGl6byBsYSBjb21wcmEgZGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEgYSB1biBwcmVjaW8gZGUgJDgwNzUwMA==', 3, CAST(N'2020-11-26T17:47:21.000' AS DateTime), 488961)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (120, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIEhvcml6b250YWwgZGUgbGEgdGFibGEgVmVoaWN1bG9TdG9jayANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gMTEyMDcgLCBBbG1hY2VuYWRvID0gMTQwNDk=', 1, CAST(N'2020-11-26T17:49:38.000' AS DateTime), 2799862)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (121, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIFZlcnRpY2FsIGRlIGxhIHRhYmxhIENvbXByYSANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gMCAsIEFsbWFjZW5hZG8gPSAxNTUzOQ==', 1, CAST(N'2020-11-26T17:49:38.000' AS DateTime), 2478212)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (122, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:49:38.000' AS DateTime), 96217)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (123, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T17:49:40.000' AS DateTime), 153559)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (124, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:49:43.000' AS DateTime), 96140)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (125, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:49:43.000' AS DateTime), 148686)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (126, 1003, N'UHJlY2lvIGNhbGN1bGFkbyBwYXJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEuIFByZWNpbyBjb21wcmEgc3VnZXJpZG8gPSA4MDc1MDAsIHByZWNpbyBkZSB2ZW50YSA9IDkyODYyNQ==', 3, CAST(N'2020-11-26T17:49:51.000' AS DateTime), 987046)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (127, 1003, N'U2UgcmVhbGl6byBsYSBjb21wcmEgZGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSBCS1oyNTEgYSB1biBwcmVjaW8gZGUgJDgwNzUwMA==', 3, CAST(N'2020-11-26T17:49:56.000' AS DateTime), 489142)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (128, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIEhvcml6b250YWwgZGUgbGEgdGFibGEgVmVoaWN1bG9TdG9jayANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBubyBjb2luY2lkZS4gQ2FsY3VsYWRvID0gMTMzNDEgLCBBbG1hY2VuYWRvID0gMTQwNDk=', 1, CAST(N'2020-11-26T17:53:11.000' AS DateTime), 2794955)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (129, 1002, N'RXJyb3IgZGUgaW50ZWdyaWRhZDogRGlnaXRvIFZlcmlmaWNhZG9yIEhvcml6b250YWwgZGUgbGEgdGFibGEgQ29tcHJhIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5vIGNvaW5jaWRlLiBDYWxjdWxhZG8gPSAxNTY2NSAsIEFsbWFjZW5hZG8gPSAxNTY2Mw==', 1, CAST(N'2020-11-26T17:53:11.000' AS DateTime), 2626786)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (130, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:53:11.000' AS DateTime), 95967)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (131, 1003, N'U2UgcmVlc3RhYmxlY2lvIGxhIGludGVncmlkYWQgZGVsIHNpc3RlbWE=', 1, CAST(N'2020-11-26T17:53:13.000' AS DateTime), 153481)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (132, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:53:15.000' AS DateTime), 96043)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (133, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:53:15.000' AS DateTime), 148589)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (134, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:54:30.000' AS DateTime), 96000)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (135, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:54:30.000' AS DateTime), 148546)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (136, 1003, N'Tm8gc2UgZW5jdWVudHJhIGVsIHZlaGljdWxvIGRlIHBhdGVudGUgPSA=', 2, CAST(N'2020-11-26T17:54:51.000' AS DateTime), 149986)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (137, 1003, N'U2UgcmVhbGl6byBsYSB2ZW50YSBkZWwgdmVoaWN1bG8gZGUgcGF0ZW50ZSA9IEJLWjI1MSBhbCBjbGllbnRlIGRlIGRvY3VtZW50byA9IDM3MjY5Nzg5', 3, CAST(N'2020-11-26T17:55:01.000' AS DateTime), 568963)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (138, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T17:56:55.000' AS DateTime), 96163)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (139, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T17:56:55.000' AS DateTime), 148709)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (140, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:02:45.000' AS DateTime), 96019)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (141, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:02:45.000' AS DateTime), 148565)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (142, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:04:18.000' AS DateTime), 96054)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (143, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:04:18.000' AS DateTime), 148600)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (144, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:08:40.000' AS DateTime), 96020)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (145, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:08:40.000' AS DateTime), 148566)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (146, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:12:47.000' AS DateTime), 96072)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (147, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:12:47.000' AS DateTime), 148618)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (148, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:19:05.000' AS DateTime), 96074)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (149, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:19:05.000' AS DateTime), 148620)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (150, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:44:58.000' AS DateTime), 96186)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (151, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:44:58.000' AS DateTime), 148732)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (152, 1002, N'U2UgZGVzYmxvcXVlbyBlbCB1c3VhcmlvIFUwMDAwMDI=', 1, CAST(N'2020-11-26T18:49:02.000' AS DateTime), 96062)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (153, 1003, N'RWwgdXN1YXJpbyBVMDAwMDAyIGluZ3Jlc28gZW4gZWwgc2lzdGVtYQ==', 3, CAST(N'2020-11-26T18:49:02.000' AS DateTime), 148608)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (154, 1003, N'RWwgdXN1YXJpbyBWbFJCZDAxRVFYZE5aejA5IHNhbGlvIGRlbCBzaXN0ZW1h', 3, CAST(N'2020-11-26T18:49:24.000' AS DateTime), 164208)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [tipo_documento], [nro_documento], [nombre], [apellido], [domicilio], [email], [telefono], [estado]) VALUES (1, 1, 37269789, N'CRISTIAN', N'MUÑOZ', N'prueba 123', N'prueba123@prueba.com', 159874563, 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([id], [es_consignacion], [id_vehiculo], [precio_sugerido], [id_cliente], [legajo_empleado], [fecha], [dvh]) VALUES (2, N'RmFsc2U=', 1, N'ODA3NTAw', 1, 2, CAST(N'2020-11-26T17:49:53.000' AS DateTime), 15665)
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Digito_Verificador] ON 

INSERT [dbo].[Digito_Verificador] ([id], [nombre_tabla], [dvv]) VALUES (1, N'Bitacora', 56774825)
INSERT [dbo].[Digito_Verificador] ([id], [nombre_tabla], [dvv]) VALUES (2, N'Patente', 148712)
INSERT [dbo].[Digito_Verificador] ([id], [nombre_tabla], [dvv]) VALUES (3, N'Usuario', 248914)
INSERT [dbo].[Digito_Verificador] ([id], [nombre_tabla], [dvv]) VALUES (4, N'VehiculoStock', 13341)
INSERT [dbo].[Digito_Verificador] ([id], [nombre_tabla], [dvv]) VALUES (5, N'Compra', 15665)
SET IDENTITY_INSERT [dbo].[Digito_Verificador] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([legajo], [tipo_documento], [nro_documento], [nombre], [apellido], [domicilio], [email], [telefono], [estado], [id_usuario]) VALUES (1, 1, 38067767, N'Franco', N'Silvestro', N'Brandsen 498', N'xeneise19@gmail.com', 1166768895, 1, 1)
INSERT [dbo].[Empleado] ([legajo], [tipo_documento], [nro_documento], [nombre], [apellido], [domicilio], [email], [telefono], [estado], [id_usuario]) VALUES (2, 1, 123456789, N'PRUEBA', N'PRUEBA', N'prueba 123', N'prueba@gmail.com', 518484451, 1, 1003)
INSERT [dbo].[Empleado] ([legajo], [tipo_documento], [nro_documento], [nombre], [apellido], [domicilio], [email], [telefono], [estado], [id_usuario]) VALUES (3, 1, 215241548, N'PRUEBA2', N'PRUEBA2', N'prueba2 123', N'prueba2@gmail.com', 15648462, 0, 1004)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([id], [resultado]) VALUES (1, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (2, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (3, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (4, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (5, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (6, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (7, 100)
INSERT [dbo].[Estado] ([id], [resultado]) VALUES (8, 100)
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (1, N'lblUsuario')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (2, N'lblContrasena')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (3, N'lblSelIdioma')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (4, N'linkCPass')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (5, N'btnIngresar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (6, N'mnuSesion')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (7, N'tsmiLogin')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (8, N'tsmiLogout')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (9, N'tsmiIdiomas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (10, N'lblCliente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (11, N'lblListaClientes')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (12, N'grpClienteElegido')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (13, N'btnAgregar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (14, N'btnModificar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (15, N'btnCancelar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (16, N'btnEliminar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (17, N'lblListaDeFamilias')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (18, N'lblNombre')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (19, N'grpFamiliaElegida')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (20, N'btnAceptar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (21, N'btnAgregarFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (22, N'btnEliminarFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (23, N'btnModificarFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (24, N'lblListaEmpleados')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (25, N'grpUsuarioElegido')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (26, N'btnDesbloquear')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (27, N'btnAdminFam')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (28, N'btnAdminPat')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (29, N'btnAgregarEmpleado')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (30, N'lblModificarCliente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (31, N'lblApellido')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (32, N'lblTipoDoc')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (33, N'lblNroDoc')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (34, N'lblDomicilio')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (35, N'lblEmail')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (36, N'lblTelefono')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (37, N'lblModificarEmpleado')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (38, N'lblTDocumento')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (39, N'lblNDocumento')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (40, N'lblModificarFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (41, N'grpDatosDeFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (42, N'grpAsignarPatentes')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (43, N'btnAsignar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (44, N'btnDesasignar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (45, N'lblReestablecerSistema')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (46, N'grpBitacora')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (47, N'lblCriticidad')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (48, N'lblFechaDesde')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (49, N'lblFechaHasta')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (50, N'btnRefrescar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (51, N'btnRestaurarBase')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (52, N'btnReestablecerDigitos')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (53, N'lblRestaurarBase')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (54, N'grpRestaurar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (55, N'lblOrigen')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (56, N'btnRestaurar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (57, N'lblCalcularEstado')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (58, N'lblMotor')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (59, N'lblCarroceria')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (60, N'lblFrenos')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (61, N'lblAmortiguacion')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (62, N'lblImpactoSonoro')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (63, N'lblInterior')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (64, N'lblBuscarCliente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (65, N'btnBuscar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (66, N'lblBitacora')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (67, N'lblBackup')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (68, N'grpBackup')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (69, N'lblDestino')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (70, N'btnGuardarBackup')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (71, N'lblAPatUsuario')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (72, N'grpDatosUsuario')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (73, N'lblPatAsignadas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (74, N'lblPatDisponibles')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (75, N'lblAFamUsuario')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (76, N'grpAsignarFamilias')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (77, N'lblFamiliasAsignadas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (78, N'lblFamiliasDisponibles')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (79, N'lblAltaDeVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (80, N'grpDatosDelVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (81, N'lblPatente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (82, N'lblMarca')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (83, N'lblTipoDeVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (84, N'lblModelo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (85, N'lblAnio')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (86, N'lblVersion')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (87, N'lblColor')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (88, N'lblKilometraje')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (89, N'btnComprobarVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (90, N'btnAgregarVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (91, N'lblAltaDeFamilia')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (93, N'lblAltaDeEmpleado')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (94, N'lblAltaCliente')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (95, N'lblAdquirirVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (96, N'btnRechazar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (97, N'btnAdquirir')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (98, N'lblPrecioCompra')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (99, N'lblPrecioVenta')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (100, N'lblFormaAdquisicion')
GO
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (101, N'btnCalcularPrecios')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (102, N'lblVenderVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (103, N'btnVender')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (104, N'lblReporteDeVentas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (105, N'grpReporte')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (106, N'tsmiCambiarPass')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (107, N'mnuAdministrarEmpleados')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (108, N'mnuAdministrarFamilias')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (109, N'mnuRespaldo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (110, N'tsmiBackup')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (111, N'tsmiRestaurar')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (112, N'mnuBitacora')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (113, N'mnuCompras')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (114, N'tsmiAdquirirVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (115, N'tsmiAltaDeVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (116, N'mnuVentas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (117, N'tsmiVenderVehiculo')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (118, N'mnuReportes')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (119, N'tsmiReporteDeVentas')
INSERT [dbo].[Etiqueta] ([id], [nombre]) VALUES (120, N'mnuAdministrarClientes')
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
GO
SET IDENTITY_INSERT [dbo].[Idioma] ON 

INSERT [dbo].[Idioma] ([id], [nombre], [es_default]) VALUES (1, N'Español', 1)
INSERT [dbo].[Idioma] ([id], [nombre], [es_default]) VALUES (2, N'English', 0)
SET IDENTITY_INSERT [dbo].[Idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1, N'AltaEmpleado', 0, 9528)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (2, N'BajaEmpleado', 0, 9477)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1003, N'AdministrarEmpleados', 0, 23635)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1004, N'AdministrarFamilias', 0, 21374)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1005, N'Backup', 0, 3795)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1006, N'Restaurar', 0, 6433)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1009, N'Bitacora', 0, 5300)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1011, N'AdquirirVehiculo', 0, 15990)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1012, N'AltaVehiculo', 0, 9755)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1013, N'VenderVehiculo', 0, 12607)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1014, N'ReporteVentas', 0, 11222)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1015, N'AdministarClientes', 0, 19596)
SET IDENTITY_INSERT [dbo].[Patente] OFF
GO
SET IDENTITY_INSERT [dbo].[PatenteUsuario] ON 

INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (96, 1003, 1)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (97, 1003, 2)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (98, 1003, 1003)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (99, 1003, 1005)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (100, 1003, 1006)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (101, 1003, 1009)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (102, 1003, 1004)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (103, 1003, 1011)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (104, 1003, 1012)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (105, 1003, 1013)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (106, 1003, 1014)
INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (107, 1003, 1015)
SET IDENTITY_INSERT [dbo].[PatenteUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Traduccion] ON 

INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (1, 1, 1, N'Usuario')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (3, 1, 2, N'User')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (4, 2, 1, N'Contraseña')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (5, 2, 2, N'Password')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (6, 3, 1, N'Seleccionar Idioma')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (7, 3, 2, N'Select Language')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (8, 4, 1, N'Cambiar Contraseña')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (9, 4, 2, N'Change Password')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (10, 5, 1, N'Ingresar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (11, 5, 2, N'Enter')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (12, 6, 1, N'Sesión')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (13, 6, 2, N'Session')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (14, 7, 1, N'Iniciar Sesión')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (15, 7, 2, N'Login')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (16, 8, 1, N'Cerrar Sesión')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (17, 8, 2, N'Logout')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (18, 9, 1, N'Idiomas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (19, 9, 2, N'Languages')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (20, 10, 1, N'Cliente')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (21, 10, 2, N'Customer')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (22, 11, 1, N'Lista Clientes')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (23, 11, 2, N'Customers List')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (24, 12, 1, N'Cliente Elegido')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (25, 12, 2, N'Chosen Customer')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (26, 13, 1, N'Agregar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (27, 13, 2, N'Add')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (28, 14, 1, N'Modificar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (29, 14, 2, N'Modify')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (30, 15, 1, N'Cancelar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (31, 15, 2, N'Cancel')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (32, 16, 1, N'Eliminar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (33, 16, 2, N'Delete')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (34, 17, 1, N'Lista de Familias')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (35, 17, 2, N'Family List')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (36, 18, 1, N'Nombre')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (37, 18, 2, N'Name')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (38, 19, 1, N'Familia Elegida')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (39, 19, 2, N'Chosen Family')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (40, 20, 1, N'Aceptar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (41, 20, 2, N'Accept')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (42, 21, 1, N'Agregar Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (43, 21, 2, N'Add Family')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (44, 22, 1, N'Eliminar Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (45, 22, 2, N'Delete Family')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (46, 23, 1, N'Modificar Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (47, 23, 2, N'Modify Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (48, 24, 1, N'Lista Empleados')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (49, 24, 2, N'Employees List')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (50, 25, 1, N'Usuario Elegido')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (51, 25, 2, N'Chosen User')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (52, 26, 1, N'Desbloquear')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (53, 26, 2, N'Unlock')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (54, 27, 1, N'Administrar Familias')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (55, 27, 2, N'Manage Families')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (56, 28, 1, N'Administrar Patentes')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (57, 28, 2, N'Manage Patents')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (59, 29, 1, N'Agregar Empleado')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (60, 29, 2, N'Add Employee')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (61, 30, 1, N'Modificar Cliente')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (62, 30, 2, N'Modify Customer')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (63, 31, 1, N'Apellido')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (64, 31, 2, N'Surname')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (65, 32, 1, N'Tipo de Documento')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (66, 32, 2, N'Document Type')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (67, 33, 1, N'Nro. de Documento')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (68, 33, 2, N'Document Num.')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (69, 34, 1, N'Domicilio')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (70, 34, 2, N'Address')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (71, 35, 1, N'Email')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (72, 35, 2, N'Email')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (73, 36, 1, N'Telefono')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (74, 36, 2, N'Phone')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (75, 37, 1, N'Modificar Empleado')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (76, 37, 2, N'Modify Employee')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (77, 38, 1, N'Tipo Documento')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (78, 38, 2, N'Document Type')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (79, 39, 1, N'Nro Documento')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (80, 39, 2, N'Document Num.')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (81, 40, 1, N'Modificar Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (82, 40, 2, N'Modify Family')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (83, 41, 1, N'Datos de Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (84, 41, 2, N'Family Data')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (85, 42, 1, N'Asignar Patentes')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (86, 42, 2, N'Assign Patents')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (87, 43, 1, N'Asignar->')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (88, 43, 2, N'Assign->')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (89, 44, 1, N'<-Desasignar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (90, 44, 2, N'<-Unassign')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (91, 45, 1, N'Reestablecer Sistema')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (92, 45, 2, N'Reset System')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (93, 46, 1, N'Bitacora')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (94, 46, 2, N'Log')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (95, 47, 1, N'Criticidad')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (96, 47, 2, N'Criticality')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (97, 48, 1, N'Fecha Desde')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (98, 48, 2, N'Date From')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (99, 49, 1, N'Fecha Hasta')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (100, 49, 2, N'Date To')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (101, 50, 1, N'Refrescar')
GO
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (102, 50, 2, N'Refresh')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (103, 51, 1, N'Restaurar Base')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (104, 51, 2, N'Restore DB')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (105, 52, 1, N'Reestablecer Digitos')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (106, 52, 2, N'Reset Digits')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (107, 53, 1, N'Restaurar Base')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (108, 53, 2, N'Restore DB')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (109, 54, 1, N'Restaurar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (110, 54, 2, N'Restore')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (111, 55, 1, N'Origen')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (112, 55, 2, N'Origin')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (113, 56, 1, N'Restaurar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (114, 56, 2, N'Restore')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (115, 57, 1, N'Calcular Estado')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (116, 57, 2, N'Calculate State')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (117, 58, 1, N'Motor')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (118, 58, 2, N'Motor')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (120, 59, 1, N'Carroceria')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (121, 59, 2, N'Body')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (122, 60, 1, N'Frenos')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (123, 60, 2, N'Breaks')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (124, 61, 1, N'Amortiguacion')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (126, 61, 2, N'Damping')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (127, 62, 1, N'Impacto Sonoro')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (128, 62, 2, N'Sound Impact')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (129, 63, 1, N'Interior')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (130, 63, 2, N'Inside')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (131, 64, 1, N'Buscar Cliente')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (132, 64, 2, N'Search Customer')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (133, 65, 1, N'Buscar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (134, 65, 2, N'Search')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (135, 66, 1, N'Bitacora')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (136, 66, 2, N'Log')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (137, 67, 1, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (138, 67, 2, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (139, 68, 1, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (140, 68, 2, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (141, 69, 1, N'Destino')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (142, 69, 2, N'Destiny')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (143, 70, 1, N'Guardar Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (144, 70, 2, N'Save Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (145, 71, 1, N'Asignar Patentes a Usuario')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (146, 71, 2, N'Assign Patents to User')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (147, 72, 1, N'Datos del Usuario')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (148, 72, 2, N'User Data')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (149, 73, 1, N'Patentes Asignadas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (150, 73, 2, N'Assigned Patents')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (151, 74, 1, N'Patentes Disponibles')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (152, 74, 2, N'Available Patents')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (153, 75, 1, N'Asignar Familias a Usuario')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (154, 75, 2, N'Assign Families to User')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (155, 76, 1, N'Asignar Familias')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (156, 76, 2, N'Assign Families')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (157, 77, 1, N'Familias Asignadas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (158, 77, 2, N'Assigned Families')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (159, 78, 1, N'Familias Disponibles')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (160, 78, 2, N'Available Families')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (161, 79, 1, N'Alta de Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (162, 79, 2, N'Vehicle Registration')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (163, 80, 1, N'Datos del Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (164, 80, 2, N'Vehicle Data')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (165, 81, 1, N'Patente')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (166, 81, 2, N'Patent')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (167, 82, 1, N'Marca')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (168, 82, 2, N'Brand')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (169, 83, 1, N'Tipo de Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (170, 83, 2, N'Type of Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (171, 84, 1, N'Modelo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (172, 84, 2, N'Model')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (173, 85, 1, N'Año')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (174, 85, 2, N'Year')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (175, 86, 1, N'Version')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (176, 86, 2, N'Version')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (177, 87, 1, N'Color')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (178, 87, 2, N'Color')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (180, 88, 1, N'Kilometraje')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (181, 88, 2, N'Mileage')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (182, 89, 1, N'Comprobar Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (183, 89, 2, N'Check Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (184, 90, 1, N'Agregar Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (185, 90, 2, N'Add Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (186, 91, 1, N'Alta de Familia')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (187, 91, 2, N'Family Register')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (188, 93, 1, N'Alta de Empleado')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (189, 93, 2, N'Employee Register')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (190, 94, 1, N'Alta de Cliente')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (191, 94, 2, N'Customer Register')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (192, 95, 1, N'Adquirir Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (193, 95, 2, N'Purchase Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (194, 96, 1, N'Rechazar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (195, 96, 2, N'Reject')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (197, 97, 1, N'Adquirir')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (198, 97, 2, N'Purchase')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (199, 98, 1, N'Precio de Compra')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (200, 98, 2, N'Purchase Price')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (201, 99, 1, N'Precio de Venta')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (202, 99, 2, N'Sale Price')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (203, 100, 1, N'Forma de Adquisicion')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (204, 100, 2, N'Form of Acquisition')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (205, 101, 1, N'Calcular Precios')
GO
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (206, 101, 2, N'Calculate Prices')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (207, 102, 1, N'Vender Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (208, 102, 2, N'Sell Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (209, 103, 1, N'Vender')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (210, 103, 2, N'Sell')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (211, 104, 1, N'Reporte de Ventas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (212, 104, 2, N'Sales Report')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (213, 105, 1, N'Reporte')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (214, 105, 2, N'Report')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (228, 106, 1, N'Cambiar Contraseña')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (229, 106, 2, N'Change Password')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (230, 107, 1, N'Administrar Empleados')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (231, 107, 2, N'Manage Employees')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (232, 108, 1, N'Administrar Familias')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (233, 108, 2, N'Manage Families')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (234, 109, 1, N'Respaldo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (235, 109, 2, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (236, 110, 1, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (237, 110, 2, N'Backup')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (238, 111, 1, N'Restaurar')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (239, 111, 2, N'Restore')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (240, 112, 1, N'Bitacora')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (241, 112, 2, N'Log')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (242, 113, 1, N'Compras')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (243, 113, 2, N'Purchases')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (244, 114, 1, N'Adquirir Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (245, 114, 2, N'Vehicle Acquire')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (246, 115, 1, N'Alta de Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (247, 115, 2, N'Vehicle Register')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (248, 116, 1, N'Ventas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (249, 116, 2, N'Sales')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (250, 117, 1, N'Vender Vehiculo')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (251, 117, 2, N'Sell Vehicle')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (252, 118, 1, N'Reportes')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (253, 118, 2, N'Reports')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (254, 119, 1, N'Reporte de ventas')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (255, 119, 2, N'Sales Report')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (256, 120, 1, N'Administrar Clientes')
INSERT [dbo].[Traduccion] ([id], [id_etiqueta], [id_idioma], [traduccion]) VALUES (258, 120, 2, N'Manage Customers')
SET IDENTITY_INSERT [dbo].[Traduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1, N'RlJBTkNP', N'3614f7b8bf42dbb37b040c9387ddc1f0', 0, 1, N'franco@logicar.com.ar', 63484)
INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1002, N'U1lTVEVN', N'54b53072540eeeb8f8e9343e71f28176', 0, 1, N'system@logicar.com', 54763)
INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1003, N'VTAwMDAwMg==', N'c1ef2baf2a4e7d6706ce5e722019c055', 0, 1, N'PPRUEBA@logicar.com.ar', 64471)
INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1004, N'VTAwMDAwMw==', N'a4799511f70c876b33dfa9c3141b7713', 0, 0, N'PPRUEBA2@logicar.com.ar', 66196)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[VehiculoStock] ON 

INSERT [dbo].[VehiculoStock] ([id], [patente], [tipo_vehiculo], [marca], [modelo], [anio], [version], [kilometraje], [color], [id_estado], [precio], [adquirido], [disponible], [id_cliente], [dvh]) VALUES (1, N'QktaMjUx', 0, N'FORD', N'FOCUS', 2018, N'S 17', 15000, N'NEGRO', 8, N'OTI4NjI1', 1, 1, 1, 13341)
SET IDENTITY_INSERT [dbo].[VehiculoStock] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([id], [id_vehiculo], [precio], [id_cliente], [legajo_empleado], [fecha]) VALUES (1, 1, 928625, 1, 2, CAST(N'2020-11-26T17:55:01.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_Usuario]    Script Date: 26/11/2020 18:50:58 ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [CX_Usuario] UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[Compuesto]  WITH CHECK ADD  CONSTRAINT [FK_Familia] FOREIGN KEY([id_familia])
REFERENCES [dbo].[Patente] ([id])
GO
ALTER TABLE [dbo].[Compuesto] CHECK CONSTRAINT [FK_Familia]
GO
ALTER TABLE [dbo].[Compuesto]  WITH CHECK ADD  CONSTRAINT [FK_Patente] FOREIGN KEY([id_patente])
REFERENCES [dbo].[Patente] ([id])
GO
ALTER TABLE [dbo].[Compuesto] CHECK CONSTRAINT [FK_Patente]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Usuario]
GO
ALTER TABLE [dbo].[PatenteUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PatenteUsuario_Patente] FOREIGN KEY([id_patente])
REFERENCES [dbo].[Patente] ([id])
GO
ALTER TABLE [dbo].[PatenteUsuario] CHECK CONSTRAINT [FK_PatenteUsuario_Patente]
GO
ALTER TABLE [dbo].[PatenteUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PatenteUsuario_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[PatenteUsuario] CHECK CONSTRAINT [FK_PatenteUsuario_Usuario]
GO
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Etiqueta] FOREIGN KEY([id_etiqueta])
REFERENCES [dbo].[Etiqueta] ([id])
GO
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Etiqueta]
GO
ALTER TABLE [dbo].[Traduccion]  WITH CHECK ADD  CONSTRAINT [FK_Traduccion_Idioma] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[Idioma] ([id])
GO
ALTER TABLE [dbo].[Traduccion] CHECK CONSTRAINT [FK_Traduccion_Idioma]
GO
USE [master]
GO
ALTER DATABASE [Diploma] SET  READ_WRITE 
GO
