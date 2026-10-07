USE DataSalud_Peru;
GO

CREATE ROLE Administrador;
CREATE ROLE Analista_Datos;
CREATE ROLE Auditor;
GO

GRANT CONTROL ON DATABASE::DataSalud_Peru TO Administrador;

GRANT SELECT ON dbo.Atencion_Leish TO Analista_Datos;
GRANT SELECT ON dbo.Ubigeo TO Analista_Datos;

GRANT SELECT ON dbo.Log_Auditoria TO Auditor;
GO