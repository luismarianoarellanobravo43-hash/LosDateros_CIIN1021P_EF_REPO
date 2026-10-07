USE DataSalud_Peru;
GO

CREATE SCHEMA dw;
GO

CREATE TABLE dw.Dim_Tiempo (
    ID_Tiempo INT IDENTITY(1,1) PRIMARY KEY,
    Anio INT,
    Semana INT,
    Etiqueta_Tiempo VARCHAR(50) 
);
GO

CREATE TABLE dw.Dim_Ubigeo (
    Codigo_Ubigeo INT PRIMARY KEY,
    Departamento VARCHAR(150),
    Provincia VARCHAR(150),
    Distrito VARCHAR(150)
);
GO

CREATE TABLE dw.Dim_Perfil_Paciente (
    ID_Perfil INT IDENTITY(1,1) PRIMARY KEY,
    Rango_Edad VARCHAR(50), 
    Sexo VARCHAR(20)
);
GO

CREATE TABLE dw.Fact_Atenciones_Leish (
    ID_Hecho INT IDENTITY(1,1) PRIMARY KEY,
    ID_Tiempo INT FOREIGN KEY REFERENCES dw.Dim_Tiempo(ID_Tiempo),
    Codigo_Ubigeo INT FOREIGN KEY REFERENCES dw.Dim_Ubigeo(Codigo_Ubigeo),
    ID_Perfil INT FOREIGN KEY REFERENCES dw.Dim_Perfil_Paciente(ID_Perfil),
    Enfermedad VARCHAR(150),
    Diagnostico VARCHAR(50),
    Total_Casos INT 
);
GO