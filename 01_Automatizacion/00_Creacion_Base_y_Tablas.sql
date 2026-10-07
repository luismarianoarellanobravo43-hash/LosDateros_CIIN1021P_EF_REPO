-- =========================================================
-- DataSalud_Peru
-- Creación de base de datos y tablas operacionales
-- Proyecto: Los Dateros - CIIN1021P
-- =========================================================

IF DB_ID(N'DataSalud_Peru') IS NULL
BEGIN
    CREATE DATABASE [DataSalud_Peru];
END;
GO

USE [DataSalud_Peru];
GO

/****** Objeto: Table [dbo].[Atencion_Leish] Fecha de script: 7/10/2026 04:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atencion_Leish](
	[ID_Atencion] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Ubigeo] [int] NULL,
	[Edad] [int] NULL,
	[Sexo] [varchar](20) NULL,
	[Enfermedad] [varchar](150) NULL,
	[Diagnostico] [varchar](50) NULL,
	[Anio] [int] NULL,
	[Semana] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Atencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Log_Auditoria] Fecha de script: 7/10/2026 04:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Auditoria](
	[ID_Log] [int] IDENTITY(1,1) NOT NULL,
	[Tabla_Afectada] [varchar](50) NULL,
	[Accion] [varchar](50) NULL,
	[Usuario] [varchar](100) NULL,
	[Fecha_Accion] [datetime] NULL,
	[Detalle] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[STG_Leishmaniosis] Fecha de script: 7/10/2026 04:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STG_Leishmaniosis](
	[departamento] [nvarchar](255) NULL,
	[provincia] [nvarchar](255) NULL,
	[distrito] [nvarchar](255) NULL,
	[localidad] [nvarchar](255) NULL,
	[enfermedad] [nvarchar](255) NULL,
	[anio] [nvarchar](255) NULL,
	[semana] [nvarchar](255) NULL,
	[diagnostic] [nvarchar](255) NULL,
	[diresa] [nvarchar](255) NULL,
	[ubigeo] [nvarchar](255) NULL,
	[localcod] [nvarchar](255) NULL,
	[edad] [nvarchar](255) NULL,
	[tipo_edad] [nvarchar](255) NULL,
	[sexo] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Ubigeo] Fecha de script: 7/10/2026 04:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubigeo](
	[Codigo_Ubigeo] [int] NOT NULL,
	[Departamento] [varchar](150) NULL,
	[Provincia] [varchar](150) NULL,
	[Distrito] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Ubigeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Log_Auditoria] ADD  DEFAULT (getdate()) FOR [Fecha_Accion]
GO
ALTER TABLE [dbo].[Atencion_Leish]  WITH CHECK ADD FOREIGN KEY([Codigo_Ubigeo])
REFERENCES [dbo].[Ubigeo] ([Codigo_Ubigeo])
GO
