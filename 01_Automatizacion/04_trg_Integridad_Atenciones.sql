-- Trigger 1: Bloquea edades imposibles (Ej. mayores a 120 años)
CREATE TRIGGER trg_Integridad_Atenciones
ON dbo.Atencion_Leish
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO dbo.Atencion_Leish (Codigo_Ubigeo, Edad, Sexo, Enfermedad, Diagnostico, Anio, Semana)
    SELECT Codigo_Ubigeo, Edad, Sexo, Enfermedad, Diagnostico, Anio, Semana
    FROM inserted
    WHERE Edad >= 0 AND Edad <= 120;
END;
GO

