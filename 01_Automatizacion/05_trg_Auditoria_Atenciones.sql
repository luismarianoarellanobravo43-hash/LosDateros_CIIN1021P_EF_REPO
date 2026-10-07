-- Trigger 2: Registra la actividad en el log de auditoría
CREATE TRIGGER trg_Auditoria_Atenciones
ON dbo.Atencion_Leish
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @RegistrosInsertados INT;
    SELECT @RegistrosInsertados = COUNT(*) FROM inserted;
    
    INSERT INTO dbo.Log_Auditoria (Tabla_Afectada, Accion, Usuario, Detalle)
    VALUES (
        'Atencion_Leish', 
        'INSERT', 
        SYSTEM_USER, 
        'Se insertaron ' + CAST(@RegistrosInsertados AS VARCHAR) + ' registros clínicos.'
    );
END;
GO