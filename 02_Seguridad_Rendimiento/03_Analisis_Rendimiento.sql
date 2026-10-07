USE DataSalud_Peru;
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT u.Departamento, COUNT(a.ID_Atencion) AS Total_Casos
FROM dbo.Atencion_Leish a
INNER JOIN dbo.Ubigeo u ON a.Codigo_Ubigeo = u.Codigo_Ubigeo
WHERE u.Departamento = 'LA LIBERTAD'
GROUP BY u.Departamento;
GO

CREATE NONCLUSTERED INDEX IX_Atencion_Leish_CodigoUbigeo
ON dbo.Atencion_Leish (Codigo_Ubigeo)
INCLUDE (ID_Atencion);
GO

SELECT u.Departamento, COUNT(a.ID_Atencion) AS Total_Casos
FROM dbo.Atencion_Leish a
INNER JOIN dbo.Ubigeo u ON a.Codigo_Ubigeo = u.Codigo_Ubigeo
WHERE u.Departamento = 'LA LIBERTAD'
GROUP BY u.Departamento;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO