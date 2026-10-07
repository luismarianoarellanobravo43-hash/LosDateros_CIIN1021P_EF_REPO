USE DataSalud_Peru;
GO

PRINT 'Iniciando proceso ETL para el Data Warehouse...';

INSERT INTO dw.Dim_Tiempo (Anio, Semana, Etiqueta_Tiempo)
SELECT DISTINCT Anio, Semana, CONCAT('Año ', Anio, ' - Sem ', Semana)
FROM dbo.Atencion_Leish 
WHERE Anio IS NOT NULL;
PRINT 'Dim_Tiempo cargada exitosamente.';

INSERT INTO dw.Dim_Ubigeo (Codigo_Ubigeo, Departamento, Provincia, Distrito)
SELECT DISTINCT 
    Codigo_Ubigeo, 
    ISNULL(Departamento, 'SIN DEPARTAMENTO'), 
    ISNULL(Provincia, 'SIN PROVINCIA'), 
    ISNULL(Distrito, 'SIN DISTRITO')
FROM dbo.Ubigeo;
PRINT 'Dim_Ubigeo cargada exitosamente.';

INSERT INTO dw.Dim_Perfil_Paciente (Rango_Edad, Sexo)
SELECT DISTINCT 
    CASE 
        WHEN Edad BETWEEN 0 AND 11 THEN 'Niño (0-11)'
        WHEN Edad BETWEEN 12 AND 17 THEN 'Adolescente (12-17)'
        WHEN Edad BETWEEN 18 AND 29 THEN 'Joven (18-29)'
        WHEN Edad BETWEEN 30 AND 59 THEN 'Adulto (30-59)'
        WHEN Edad >= 60 THEN 'Adulto Mayor (60+)'
        ELSE 'Desconocido'
    END AS Rango_Edad,
    ISNULL(Sexo, 'NO REGISTRADO') AS Sexo
FROM dbo.Atencion_Leish;
PRINT 'Dim_Perfil_Paciente cargada exitosamente.';

INSERT INTO dw.Fact_Atenciones_Leish (ID_Tiempo, Codigo_Ubigeo, ID_Perfil, Enfermedad, Diagnostico, Total_Casos)
SELECT 
    t.ID_Tiempo,
    a.Codigo_Ubigeo,
    p.ID_Perfil,
    ISNULL(a.Enfermedad, 'LEISHMANIOSIS'),
    ISNULL(a.Diagnostico, 'SIN DIAGNOSTICO'),
    COUNT(a.ID_Atencion) AS Total_Casos
FROM dbo.Atencion_Leish a
INNER JOIN dw.Dim_Tiempo t ON a.Anio = t.Anio AND a.Semana = t.Semana
INNER JOIN dw.Dim_Perfil_Paciente p ON ISNULL(a.Sexo, 'NO REGISTRADO') = p.Sexo 
    AND (CASE 
        WHEN a.Edad BETWEEN 0 AND 11 THEN 'Niño (0-11)'
        WHEN a.Edad BETWEEN 12 AND 17 THEN 'Adolescente (12-17)'
        WHEN a.Edad BETWEEN 18 AND 29 THEN 'Joven (18-29)'
        WHEN a.Edad BETWEEN 30 AND 59 THEN 'Adulto (30-59)'
        WHEN a.Edad >= 60 THEN 'Adulto Mayor (60+)'
        ELSE 'Desconocido'
    END) = p.Rango_Edad
GROUP BY 
    t.ID_Tiempo,
    a.Codigo_Ubigeo,
    p.ID_Perfil,
    ISNULL(a.Enfermedad, 'LEISHMANIOSIS'),
    ISNULL(a.Diagnostico, 'SIN DIAGNOSTICO');
PRINT 'Fact_Atenciones_Leish cargada exitosamente. ETL FINALIZADO.';
GO