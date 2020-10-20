USE [master]
GO
/****** Object:  Database [Diploma]    Script Date: 16/10/2020 10:46:59 p. m. ******/
CREATE DATABASE [Diploma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Diploma', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Diploma.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Diploma_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Diploma_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 16/10/2020 10:46:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[criticidad] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[dvh] [bigint] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compuesto]    Script Date: 16/10/2020 10:46:59 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitoVerificador]    Script Date: 16/10/2020 10:46:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitoVerificador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tabla] [nvarchar](50) NOT NULL,
	[dvv] [bigint] NOT NULL,
 CONSTRAINT [PK_DigitoVerificador] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 16/10/2020 10:46:59 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patente]    Script Date: 16/10/2020 10:46:59 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatenteUsuario]    Script Date: 16/10/2020 10:46:59 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/10/2020 10:46:59 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (9, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T18:42:00.000' AS DateTime), 50018)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (10, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T18:44:00.000' AS DateTime), 50082)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (11, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T18:45:00.000' AS DateTime), 50143)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (12, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T18:51:00.000' AS DateTime), 50049)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (13, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T22:30:00.000' AS DateTime), 51384)
INSERT [dbo].[Bitacora] ([id], [id_usuario], [descripcion], [criticidad], [fecha], [dvh]) VALUES (14, 1, N'ac6bb191a7a120e53f711e1693e64e67', 3, CAST(N'2020-10-08T22:32:00.000' AS DateTime), 51323)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1, N'AltaEmpleado', 0, 32)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (2, N'BajaEmpleado', 0, 564984)
INSERT [dbo].[Patente] ([id], [nombre], [es_familia], [dvh]) VALUES (1002, N'prueba', 1, 2263)
SET IDENTITY_INSERT [dbo].[Patente] OFF
SET IDENTITY_INSERT [dbo].[PatenteUsuario] ON 

INSERT [dbo].[PatenteUsuario] ([id], [id_usuario], [id_patente]) VALUES (3, 1, 1002)
SET IDENTITY_INSERT [dbo].[PatenteUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1, N'ZnJhbmNv', N'c893bad68927b457dbed39460e6afd62', 1, 1, N'', 41863)
INSERT [dbo].[Usuario] ([id], [usuario], [contrasena], [contador], [estado], [email], [dvh]) VALUES (1002, N'U1lTVEVN', N'54b53072540eeeb8f8e9343e71f28176', 0, 1, N'system@logicar.com', 0)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_Usuario]    Script Date: 16/10/2020 10:47:00 p. m. ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [CX_Usuario] UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [Diploma] SET  READ_WRITE 
GO
